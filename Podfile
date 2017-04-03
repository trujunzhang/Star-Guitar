# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Star Guitar' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Star Guitar
  pod 'DeviceKit', '~> 1.0'
  pod 'SnapKit', '~> 3.2.0'
  pod 'FontBlaster'

  # Collect live crash reports, get feedback from your users, distribute your
  # betas, and analyze your test coverage with HockeyApp.
  pod 'HockeySDK', '~> 4.1.4'

  # pod 'Reveal-SDK', :configurations => ['Debug']

  #pod 'AudioKit', '~> 3.5'
  #pod 'AudioPlayerSwift', '~> 1.5.1'
  #pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'

  target 'Star GuitarTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Star GuitarUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end

end
