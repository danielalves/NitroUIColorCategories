Pod::Spec.new do |s|
  s.name         = "NitroUIColorCategories"
  s.version      = "1.0.0"
  s.summary      = "Initialization, conversion, RGBA component getters and luminance utilities for iOS UIColor type."
  s.homepage     = "http://github.com/danielalves/NitroUIColorCategories"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Daniel L. Alves"
  s.social_media_url   = "http://twitter.com/alveslopesdan"
  s.source       = { :git => "https://github.com/danielalves/NitroUIColorCategories.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.source_files  = "NitroUIColorCategories/NitroUIColorCategories"
  s.requires_arc = true
end
