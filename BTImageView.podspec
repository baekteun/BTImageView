#
# Be sure to run `pod lib lint BTImageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BTImageView'
  s.version          = '0.1.1'
  s.summary          = 'Simple cool imageView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'BTImageView is cool ImageView for images'

  s.homepage         = 'https://github.com/baekteun/BTImageView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'baekteun' => 'baegteun@gmail.com' }
  s.source           = { :git => 'https://github.com/baekteun/BTImageView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Sources/BTImageView/Classes/**/*'
  
  s.swift_versions = '5.0'
  s.frameworks = 'UIKit'
end
