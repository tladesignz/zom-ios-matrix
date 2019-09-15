platform :ios, '9.3'
use_frameworks!

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    next unless config.name == 'Debug'
    config.build_settings['LD_RUNPATH_SEARCH_PATHS'] = [
      '$(FRAMEWORK_SEARCH_PATHS)'
    ]
  end
end

def shared_pods
    pod 'KeanuCore', :path => '../../Keanu'
    #pod 'MatrixKit', :git => 'https://github.com/N-Pex/matrix-ios-kit.git', :branch => 'fix_apns_push'
    #pod 'MatrixSDK', :git => 'https://github.com/matrix-org/matrix-ios-sdk.git', :branch => 'develop'
end

target 'Zom 2' do
  shared_pods

  pod 'BarcodeScanner', :git => 'https://github.com/htothee/BarcodeScanner.git'
  pod 'QRCode', :git => 'https://github.com/brackendev/QRCode.git'

  pod 'Keanu', :path => '../../Keanu'
end

target 'ShareExtension' do
  shared_pods

  pod 'KeanuExtension', :path => '../../Keanu'
end
