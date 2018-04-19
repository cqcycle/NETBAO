

Pod::Spec.new do |s|

s.name         = "WXXhelper"
s.version      = "1.0.3"
s.summary      = "WXXhelper WXXhelper WXXhelper WXXhelper."
s.homepage     = "https://github.com/cqcycle/NETBAO.git"
s.license      = "MIT"
s.author       = { "zhoubo" => "15696564260@163.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/cqcycle/NETBAO.git", :tag => s.version.to_s }

s.source_files  = "WXXhelper", "WXXhelper/**/*.{h,m}"
# s.public_header_files = "WXXhelper/**/*.h"
# s.frameworks = "UIKit", "Foundation"
s.requires_arc = true
s.dependency "CycleAlertAnyView", "~> 1.0.0"
s.dependency "SDWebImage", "~> 4.3.0"



end
