Pod::Spec.new do |spec|
  spec.name         = "CommonSwiftUI"
  spec.version      = "1.1.2"
  spec.summary      = "Commonly used UI components that enhance and enrich the SwiftUI experience."
  spec.description  = <<-DESC
  A collection of essential UI components that enhance and enrich SwiftUI. All designed with modern aesthetics and smooth animations. Perfect for adding a polished touch to any SwiftUI application.
                   DESC

  spec.homepage     = "https://github.com/Enryun/Common_SwiftUI"
  
  spec.license      = { :type => "MIT", :text => 'MIT License
Copyright (c) 2024 James Thang

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
SOFTWARE.' }

  spec.author             = { "JamesThang" => "jamesthang1996@gmail.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/jamesthang/"

  spec.platform     = :ios
  spec.platform     = :ios, "15.0"

  spec.source       = { :git => "https://github.com/Enryun/Common_SwiftUI.git", :tag => "#{spec.version}" }

  spec.module_name = 'CommonSwiftUI'
  spec.vendored_frameworks = 'Sources/CommonSwiftUI.xcframework'
  spec.exclude_files = "Sources/Exclude"
  spec.swift_versions = '5.9'

end
