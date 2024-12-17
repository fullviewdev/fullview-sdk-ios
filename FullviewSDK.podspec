Pod::Spec.new do |s|
  s.name         = 'FullviewSDK'
  s.version      = '0.9.4'
  s.summary      = 'Enhance your customer support with screen-sharing/real-time assistance.'
   s.description  = <<-DESC
                     With Fullview SDK, you can effortlessly integrate screen-sharing, real-time assistance, and advanced data redaction for sensitive information, enhancing user support while prioritizing security and privacy.
                   DESC
  s.homepage     = 'https://github.com/fullviewdev/fullview-sdk-ios'
  s.license      = { :type => 'Proprietary', :text => <<-LICENSE
                   Copyright 2024 Fullview. All rights reserved.

                   This software and its documentation are proprietary and may not be copied, modified, redistributed, or used in any way without prior written consent from Fullview.
                   LICENSE
  }
  s.author       = { 'Fullview' => 'support@fullview.io' }
  s.source       = { :http => 'https://github.com/fullviewdev/fullview-sdk-ios/releases/download/v0.9.4/FullviewSDK.xcframework.zip' }

  s.platform     = :ios, '15.0'
  s.vendored_frameworks = 'FullviewSDK.xcframework'
  s.dependency 'Daily', '~> 0.25.0'
  s.swift_version = '5.6'
end
