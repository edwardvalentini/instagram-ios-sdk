# CocoaPods podspec for IGSDKLoginKit

Pod::Spec.new do |s|
  s.name             = "IGSDKLoginKit"
  s.version          = "0.0.1"
  s.summary          = "Instagram iOS SDK is a framework built on top of Instagram's public API."
  s.homepage         = "https://github.com/jaunesarmiento/instagram-ios-sdk"
  s.license          = 'MIT'
  s.author           = { "Jaune Sarmiento" => "hawnecarlo@gmail.com" }
  s.source           = { :git => "https://github.com/jaunesarmiento/instagram-ios-sdk.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.weak_frameworks = 'UIKit', 'Foundation'

  s.source_files   = "IGSDKLoginKit/IGSDKLoginKit/**/*.{h,m}"
  s.public_header_files = "IGSDKLoginKit/IGSDKLoginKit/*.{h}"
  s.header_dir = "IGSDKLoginKit"
  s.dependency 'IGSDKCoreKit'
end
