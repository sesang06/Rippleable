#
# Be sure to run `pod lib lint Rippleable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Rippleable'
  s.version          = '0.1.0'
  s.summary          = 'Simple Material Rippleable Button.'


  s.description      = 'A Simple Material Rippleable Button, based by objective-C material-ios design, converting its essential codes into Swift.'
  s.homepage         = 'https://github.com/sesang06/Rippleable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sesang06' => 'sesang06@naver.com' }
  s.source           = { :git => 'https://github.com/sesang06/Rippleable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Rippleable/**/*'


  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation', 'CoreGraphics'
end
