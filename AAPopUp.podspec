Pod::Spec.new do |s|
s.name             = 'AAPopUp'
s.version          = '2.0'
s.summary          = 'AAPopUp is a simple & easy-to-use popup designed to present customizable storyboard based view controller modal alert, written in Swift.'

s.description      = <<-DESC
AAPopUp is a simple and easy-to-use popup view controller designed to present customizable storyboard based view controller as a modal alert, written in Swift. It supports tag-based and dedicated view controller based implementation.
DESC

s.homepage         = 'https://github.com/EngrAhsanAli/AAPopUp'
s.screenshots     = 'https://raw.githubusercontent.com/EngrAhsanAli/AAPopUp/master/Screenshots/AAPopUp.png'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Engr. Ahsan Ali' => 'hafiz.m.ahsan.ali@gmail.com' }
s.source           = { :git => 'https://github.com/EngrAhsanAli/AAPopUp.git', :tag => s.version.to_s }

s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

s.ios.deployment_target = '8.0'
s.source_files = 'AAPopUp/Classes/**/*'


end

