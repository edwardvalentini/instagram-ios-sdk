# CocoaPods podspec for Instagram-iOS-SDK

Pod::Spec.new do |s|
  s.name             = "InstagramSDK"
  s.version          = "0.0.2"
  s.summary          = "Instagram iOS SDK is a framework built on top of Instagram's public API."
  s.homepage         = "https://github.com/jaunesarmiento/instagram-ios-sdk"
  s.license          = 'MIT'
  s.author           = { "Jaune Sarmiento" => "hawnecarlo@gmail.com" }
  s.source           = { :git => "https://github.com/jaunesarmiento/instagram-ios-sdk.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.weak_frameworks = 'UIKit', 'Foundation'

  s.subspec 'CoreKit' do |spec|
    spec.source_files   = "IGSDKCoreKit/IGSDKCoreKit/**/*.{h,m}"
    spec.public_header_files = "IGSDKCoreKit/IGSDKCoreKit/*.{h}"
    spec.header_dir = "IGSDKCoreKit"
  end
  s.subspec 'LoginKit' do |spec|
    spec.source_files   = "IGSDKLoginKit/IGSDKLoginKit/**/*.{h,m}"
    spec.public_header_files = "IGSDKLoginKit/IGSDKLoginKit/*.{h}"
    spec.header_dir = "IGSDKLoginKit"
    spec.dependency 'InstagramSDK/CoreKit'
  end
end
