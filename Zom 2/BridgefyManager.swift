//
//  BridgefyManager.swift
//  Zom 2
//
//  Created by Benjamin Erhart on 17.03.20.
//  Copyright © 2020 Zom. All rights reserved.
//

import UIKit
import BFTransmitter
import KeanuCore
import MatrixKit

class BridgefyManager: NSObject, BFTransmitterDelegate {

    static let shared = BridgefyManager()

    private class var roomId: String? {
        get {
            return UserDefaults.standard.string(forKey: "\(String(describing: type(of: self)))_room_id")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "\(String(describing: type(of: self)))_room_id")
        }
    }

    private let transmitter: BFTransmitter

    private var room: MXRoom?

    private override init() {
        transmitter = BFTransmitter(apiKey: Config.bridgefyApiKey)

        super.init()

        transmitter.delegate = self
        transmitter.isBackgroundModeEnabled = true

        getOrCreateRoom(BridgefyManager.roomId)
    }

    func start() {
        transmitter.start()
    }

    func stop() {
        transmitter.stop()
    }

    /**
     TODO: This needs to be called, when a user sends a message to the room.
     MXEvent notifications for our special room need to be listened to and acted upon message send events.
     */
    func broadcast(_ message: String) throws {
        try transmitter.send(["text": message], toUser: nil, options: .broadcastReceiver)
    }


    // MARK: BFTransmitterDelegate

    func transmitter(_ transmitter: BFTransmitter, didSendDirectPacket packetID: String) {
        // TODO
    }

    func transmitter(_ transmitter: BFTransmitter, didFailForPacket packetID: String, error: Error?) {
        // TODO
    }

    func transmitter(_ transmitter: BFTransmitter, didReceive dictionary: [String : Any]?,
                     with data: Data?, fromUser user: String, packetID: String, broadcast: Bool, mesh: Bool) {

        // TODO
    }

    func transmitter(_ transmitter: BFTransmitter, didDetectConnectionWithUser user: String) {
        // Ignored. We do nearby broadcast only.
    }

    func transmitter(_ transmitter: BFTransmitter, didDetectDisconnectionWithUser user: String) {
        // Ignored. We do nearby broadcast only.
    }

    func transmitter(_ transmitter: BFTransmitter, didFailAtStartWithError error: Error) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController?.top {
            AlertHelper.present(vc, message: error.localizedDescription)
        }
    }

    func transmitter(_ transmitter: BFTransmitter, didOccur event: BFEvent, description: String) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController?.top {
            AlertHelper.present(vc, message: description)
        }
    }


    // MARK: Private Methods

    private func getOrCreateRoom(_ roomId: String?) {
        guard let session = MXKAccountManager.shared()?.activeAccounts?.first?.mxSession else {
            return
        }

        if let roomId = roomId {
            room = session.room(withRoomId: roomId)
        }
        else {
            let params: [String: Any] = [
                "visibility": "private",
                "name": "Around Me".localize(),
                "topic": "Messages sent by people which are (physically) near me.".localize(),
                "initial_state": [
                    ["type": kMXEventTypeStringRoomHistoryVisibility,
                     "content": ["history_visibility": kMXRoomHistoryVisibilityJoined]],
                    ["type": kMXEventTypeStringRoomEncryption,
                     "content": ["algorithm": kMXCryptoMegolmAlgorithm]]]]

            session.createRoom(parameters: params) { [weak self] response in
                if response.isSuccess {
                    self?.room = response.value
                    BridgefyManager.roomId = self?.room?.roomId
                }
            }
        }
    }
}
