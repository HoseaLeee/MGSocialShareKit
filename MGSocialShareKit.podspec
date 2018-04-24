#
# Be sure to run `pod lib lint MGSocialShareKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MGSocialShareKit'
  s.version      = "1.0.0"
  s.summary      = "基于友盟6.9.0制作的分享组件，包含了国内大部分的平台"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
基于友盟6.9.0制作的分享组件，包含了国内大部分的平台。微信、QQ、支付宝等。
                       DESC

  s.homepage         = 'https://github.com/HoseaLeee/MGSocialShareKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HoseaLeee' => 'hosealee@126.com' }
  s.source           = { :git => 'https://github.com/HoseaLeee/MGSocialShareKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

 #s.source_files = 'MGSocialShareKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MGSocialShareKit' => ['MGSocialShareKit/Assets/*.png']
  # }

  s.vendored_frameworks = 'MGSocialShareKit/MGSocialShareKit.framework'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
