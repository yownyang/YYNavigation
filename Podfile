#source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '16.0'


ENV['COCOAPODS_DISABLE_STATS'] = 'true'
install! 'cocoapods', :disable_input_output_paths => true

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 16
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16'
          end
          xcconfig_path = config.base_configuration_reference.real_path
          xcconfig = File.read(xcconfig_path)
          xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
          File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
        end
    end
end

target 'YYNavigationExample' do
   pod 'YYNavigation', '0.5.0'
   pod 'Masonry'
#   pod 'YYNavigation', :path=>'~/Downloads/yynavigation/YYNavigation.podspec'
end
