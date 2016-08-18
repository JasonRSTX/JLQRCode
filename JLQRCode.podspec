Pod::Spec.new do |s|
  s.name             = 'JLQRCode'
  s.version          = '0.1.0'
  s.summary          = 'Simple QRCode detector and generator.'
  s.description      = <<-DESC
                        Simple QRCode detector and generator
                       DESC

  s.homepage         = 'https://github.com/JasonRSTX/JLQRCode'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JasonLi' => 'rstx_reg@aliyun.com' }
  s.source           = { :git => 'https://github.com/JasonRSTX/JLQRCode.git', :tag => s.version.to_s }
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'

  s.source_files = 'JLQRCode/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
  
  s.resource_bundles = {
    'JLQRCodeAssets' => ['JLQRCode/Assets/*.*']
  }

  s.frameworks = 'UIKit'

end
