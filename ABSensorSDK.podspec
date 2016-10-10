Pod::Spec.new do |s|
  s.name         = "ABSensorSDK"
  s.version      = "0.1"
  s.summary      = "asensor SDK for iOS"
  s.homepage     = "https://github.com/AprilBrother/ABSensor-iOS-SDK"
  s.author       = { "AprilBrother" => "tech@aprbrother.com" }
  s.platform     = :ios
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/AprilBrother/ABSensor-iOS-SDK.git", :tag => s.version }
  s.ios.vendored_frameworks = "ABSensorSDK.framework"
  s.frameworks = "CoreBluetooth"
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright 2013 AprilBrother LLC, Inc. All rights reserved.
      LICENSE
  }
end
