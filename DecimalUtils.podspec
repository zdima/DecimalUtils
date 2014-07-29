Pod::Spec.new do |s|
  s.name         = 'DecimalUtils'
  s.version      = '1.0'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/zdima/DecimalUtils'
  s.authors      = { 'Dmitriy Zakharkin' => 'mail@zdima.net' }
  s.summary      = 'Utility functions to allow direct manipulation with NSDecimal'

# Source Info
  s.source       = { :git => 'https://github.com/zdima/DecimalUtils.git', :tag => '1.0' }
  s.source_files = 'DecimalUtils/DecimalUtils.*'
  s.requires_arc = true
  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '6.0'
  
end
