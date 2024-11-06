Pod::Spec.new do |s|
  s.name             = 'flutter_viewer_usdz'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for viewing USDZ files'
  s.description      = <<-DESC
A Flutter plugin for viewing USDZ files with support for iOS platforms.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.swift_version = '5.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end