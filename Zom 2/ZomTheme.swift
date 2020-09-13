//
//  ZomTheme.swift
//  Zom 2
//
//  Created by N-Pex 07.02.20.
//  Copyright © 2020 Zom. All rights reserved.
//

import Keanu

public class ZomTheme: Theme {
    
    /**
     Singleton instance.
     */
    public static let shared = ZomTheme()
    
    public func createWelcomeViewController() -> WelcomeViewController {
        return ZomWelcomeViewController(nibName: String(describing: ZomWelcomeViewController.self),
                                        bundle: Bundle(for: type(of: self)))
    }

    public func createAddAccountViewController() -> AddAccountViewController {
        return AddAccountViewController(nibName: "ZomAddAccountViewController",
                                        bundle: Bundle(for: type(of: self)))
    }

    public func createEnablePushViewController() -> EnablePushViewController {
        return EnablePushViewController(nibName: "ZomEnablePushViewController",
                                        bundle: Bundle(for: type(of: self)))
    }

    public func createMainViewController() -> MainViewController {
        return BaseTheme.shared.createMainViewController()
    }

    public func createChatListViewController() -> ChatListViewController {
        return BaseTheme.shared.createChatListViewController()
    }

    public func createDiscoverViewController() -> DiscoverViewController {
        return ZomDiscoverViewController()
    }

    public func createMeViewController() -> MeViewController {
        return BaseTheme.shared.createMeViewController()
    }

    public func createRoomViewController() -> RoomViewController {
        let vc = ZomRoomViewController()
        vc.hidesBottomBarWhenPushed = true
        return vc
    }

    public func createRoomSettingsViewController() -> RoomSettingsViewController {
        return BaseTheme.shared.createRoomSettingsViewController()
    }

    public func createProfileViewController() -> ProfileViewController {
        return BaseTheme.shared.createProfileViewController()
    }

    public func createStoryViewController() -> StoryViewController {
        return BaseTheme.shared.createStoryViewController()
    }

    public func createStoryAddMediaViewController() -> StoryAddMediaViewController {
        return BaseTheme.shared.createStoryAddMediaViewController()
    }

    public func createStoryGalleryViewController() -> StoryGalleryViewController {
        return BaseTheme.shared.createStoryGalleryViewController()
    }

    public func createStoryEditorViewController() -> StoryEditorViewController {
        return BaseTheme.shared.createStoryEditorViewController()
    }

    public func createStickerPackViewController() -> StickerPackViewController {
        return BaseTheme.shared.createStickerPackViewController()
    }

    public func createPickStickerViewController() -> PickStickerViewController {
        return BaseTheme.shared.createPickStickerViewController()
    }

    public func createChooseFriendsViewController() -> ChooseFriendsViewController {
        return BaseTheme.shared.createChooseFriendsViewController()
    }

    public func createAddFriendViewController() -> AddFriendViewController {
        return BaseTheme.shared.createAddFriendViewController()
    }

    public func createShowQrViewController() -> ShowQrViewController {
        return BaseTheme.shared.createShowQrViewController()
    }

    public func createVerificationViewController() -> VerificationViewController {
        return BaseTheme.shared.createVerificationViewController()
    }

    public func createPhotoStreamViewController() -> PhotoStreamViewController {
        return BaseTheme.shared.createPhotoStreamViewController()
    }
    
    public func createChatBubble(type: BubbleViewType, rect: CGRect) -> CGPath? {
        return BaseTheme.shared.createChatBubble(type: type, rect: rect)
    }

    public func createQrScanViewController() -> QrScanViewController {
        return BaseTheme.shared.createQrScanViewController()
    }
    
    public func createNewDeviceViewController() -> NewDeviceViewController {
        return BaseTheme.shared.createNewDeviceViewController()
    }
    
    public func createManualCompareViewController() -> ManualCompareViewController {
        return BaseTheme.shared.createManualCompareViewController()
    }
    
    public func createIntrusionViewController() -> IntrusionViewController {
        return BaseTheme.shared.createIntrusionViewController()
    }

}
