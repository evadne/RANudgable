Pod::Spec.new do |s|
  s.name         = "RANudgable"
  s.version      = "0.0.1"
  s.summary      = "Call frame-by-frame callbacks on implicit UIView animations.."
  s.homepage     = "http://github.com/evadne/RANudgable"
  s.license      = 'Public Domain'
  s.author       = { "Evadne Wu" => "ev@radi.ws" }
  s.source       = { :git => "http://github.com/evadne/RANudgable.git", :tag => "0.0.1" }
  s.platform     = :ios, '6.0'
  s.source_files = 'RANudgable', 'Classes/**/*.{h,m}'
  s.exclude_files = 'RANudgable/Exclude'
  s.frameworks = 'QuartzCore', 'UIKit'
  s.requires_arc = true
end
