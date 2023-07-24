
Pod::Spec.new do |spec|
 
  spec.name         = "ZZGDAdSDK"
  spec.version      = "0.7"
  spec.summary      = "iOS 国内变现SDK"

  spec.description  = <<-DESC
                  iOS 国内变现SDK
                   DESC

  spec.license      = {
    :type => 'MIT',
    :file => 'LICENSE',
    :text => 'MIT License
    
Copyright (c) 2020 DataEngineering / SoftwareDevelopKit

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
'
  }
  
  spec.author       = { "zhengzhanghai" => "zzh_xiaohai@163.com" }
  spec.platform     = :ios, "11.0"
  spec.ios.deployment_target = "11.0"
  
  spec.requires_arc = true
  spec.static_framework = true
  
  spec.ios.dependency 'Ads-Fusion-CN-Beta/CSJMediation', '5.3.5.1'
  spec.ios.dependency 'Ads-Fusion-CN-Beta/CSJMDebugTools', '5.3.5.1'
  spec.ios.dependency 'GDTMobSDK', '4.14.30'

  
  spec.homepage     = "https://github.com/zhengzhanghai/ZZGDAdSDK"
  spec.source       = { :git => "git@github.com:zhengzhanghai/ZZGDAdSDK.git", :tag => "#{spec.version}" }

  #路径是相对git仓库的
  spec.source_files  = "ZZGDAdSDK/ZZGDAdSDK/**/*.{h,m,swift}"
  
  spec.pod_target_xcconfig = {
    'VALID_ARCHS[sdk=iphoneos*]' => 'arm64',
    'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64'
  }
  
  spec.xcconfig = { "OTHER_LDFLAGS" => "-ObjC"}
  spec.pod_target_xcconfig = { "DEFINES_MODULE" => "YES" }
  
end
