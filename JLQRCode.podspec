Pod::Spec.new do |s|
  s.name             = 'JLQRCode'
  s.version          = '0.1.1'
  s.summary          = 'Simple QRCode detector and generator.'
  s.homepage         = 'https://github.com/JasonRSTX/JLQRCode'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JasonLi' => 'rstx_reg@aliyun.com' }
  s.source           = { :git => 'https://github.com/JasonRSTX/JLQRCode.git', :tag => s.version.to_s}
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'

  s.source_files = 'JLQRCode/Classes/JLQRCode.h'
  s.public_header_files = 'JLQRCode/Classes/JLQRCode.h'
  # s.source_files = 'JLQRCode/Classes/**/*.*'
  # s.public_header_files = 'JLQRCode/Classes/**/*.h'
  
  s.resource_bundles = {
    'JLQRCodeAssets' => ['JLQRCode/Assets/*.*']
  }

  s.frameworks = 'UIKit'

  s.subspec 'QRCapture' do |capture|
  	capture.source_files = 'JLQRCode/Classes/QRCapture/*.*'
  	capture.public_header_files = 'JLQRCode/Classes/QRCapture/*.h'
  end

  s.subspec 'QRGenerator' do |generator|
  	generator.source_files = 'JLQRCode/Classes/QRGenerator/*.*'
  	generator.public_header_files = 'JLQRCode/Classes/QRGenerator/*.h'
  end

end

