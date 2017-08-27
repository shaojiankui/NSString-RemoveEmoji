version = "2.0";

Pod::Spec.new do |s|
  s.name         = "NSString-RemoveEmoji"
  s.version      = version
  s.summary      = "NSString+RemoveEmoji,A category detecting or completely remove Emoji in NSString"
  s.homepage     = "https://github.com/shaojiankui/NSString-RemoveEmoji"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "skyfox" => "i@skyfox.org" }
  s.social_media_url   = "http://www.skyfox.org"
  s.platform     = :ios
  s.requires_arc = true
  s.source       = { :git => "https://github.com/shaojiankui/NSString-RemoveEmoji.git", :tag => "#{version}" }
  s.source_files = "NSString-RemoveEmoji/NSString-RemoveEmoji/NSString+RemoveEmoji.{h,m}"
end