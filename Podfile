# Uncomment the next line to define a global platform for your project
platform :ios, '13.2'

target 'TalkingSns' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Talking
  pod 'RealmSwift', '4.4.0'
  
  # GRPC_Client
  pod 'RemoteClient', path: './RemoteClient'
  
  pod 'ReactiveSwift', '~> 6.1'
  pod 'ReactiveCocoa', '~> 10.1'
  
  pod 'CocoaLumberjack/Swift'

  target 'TalkingSnsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TalkingSnsUITests' do
    # Pods for testing
  end

end
