Pod::Spec.new do |s|

  s.name         = "MKHProtocolBlocks"
  s.version      = "1.0.0"
  s.summary      = "Replacing protocol callbacks in Cocoa Touch with blocks."
  s.homepage     = "https://github.com/maximkhatskevich/MKHProtocolBlocks"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Maxim Khatskevich" => "maxim.khatskevich@gmail.com" }

  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.8"

  s.source       = { :git => "https://github.com/maximkhatskevich/MKHProtocolBlocks.git", :tag => "#{s.version}" }
  
  s.framework = "Foundation"
  s.framework = "UIKit"

  s.requires_arc = true

  s.source_files  = "Src/*.{h,m}"

end
