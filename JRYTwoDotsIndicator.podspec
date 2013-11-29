Pod::Spec.new do |s|

  s.name         = "JRYTwoDotsIndicator"
  s.version      = "0.0.1"
  s.summary      = "Simple circular two dots pull-to-refresh and progress indicator views."
  s.description  = "Simple circular two dots pull-to-refresh and progress indicator views with customizable colors."
  s.homepage     = "https://github.com/jurysch/JRYTwoDotsIndicator"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Justin Schottlaender" => "jurysch@sbcglobal.net" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/jurysch/JRYTwoDotsIndicator.git", :tag => "0.0.1" }
  s.source_files = '*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
  s.dependency 'SSPullToRefresh', '~> 1.1.2'

end
