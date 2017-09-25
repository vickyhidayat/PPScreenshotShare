#
# Be sure to run `pod lib lint PPScreenshotShare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PPScreenshotShare'
  s.version          = '0.1.0'
  s.summary          = 'PPScreenshotShare share your iOS app screenshot without any line of code!!'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
PPScreenshotShare is a customizable screenshot share controller for iOS app.
It provides simple & modern look with theming support & .xib user interface customizations.
It uses iOS UIActivityViewController for actual sharing with easy to use interfaces & block based callbacks.
                       DESC

  s.homepage         = 'https://github.com/vickyhidayat/PPScreenshotShare'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vicky Hidayat' => 'vicky.hidayat@yahoo.com' }
  s.source           = { :git => 'https://github.com/vickyhidayat/PPScreenshotShare.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PPScreenshotShare/Classes/**/*', 'PPScreenshotShare/Resources/**/*'

  # s.resource_bundles = {
  #   'PPScreenshotShare' => ['PPScreenshotShare/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreGraphics'
  # s.dependency 'AFNetworking', '~> 2.3'
end
