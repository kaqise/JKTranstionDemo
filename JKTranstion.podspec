Pod::Spec.new do |s|
  s.name         = "JKTranstion"
  s.version      = "1.0.0"
  s.summary      = "JKTranstionCustomPresent"
  s.homepage     = "https://github.com/kaqise/JKTranstionDemo"
  s.license      = "MIT"
  s.author       = { "Jessica" => "15804253933@163.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/kaqise/JKTranstionDemo.git", :tag => s.version }
  s.source_files  = "JKTranstion", "JKTranstion/**/*.{h,m}"
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  s.frameworks  = "UIKit"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
