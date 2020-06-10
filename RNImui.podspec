# coding: utf-8


require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
version = package['version']

source = { :git => 'https://github.com/sky1990/react-native-imui.git' }
if version == '1000.0.0'
  # This is an unpublished version, use the latest commit hash of the react-native repo, which we’re presumably in.
  source[:commit] = `git rev-parse HEAD`.strip
else
  source[:tag] = "v#{version}"
end

Pod::Spec.new do |s|
  s.name                  = "RNImui"
  s.version               = version
  s.summary            = "A React component for imui."
  s.homepage          = "https://github.com/sky1990"
  s.requires_arc       = true
  s.license                = "None"
  s.author                 = {"leon" => "1542262815@qq.com"}
  s.platform              = :ios , "9.0"
  s.source                 = source
  s.source_files        = "**/*.{h,m}"

  s.dependency 'React-Core'
  
end
