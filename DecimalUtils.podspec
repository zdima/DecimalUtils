Pod::Spec.new do |s|
  s.name         = 'DecimalUtils'
  s.version      = '1.0'
  s.license      =  :type => 'MIT'
  s.homepage     = 'https://github/zdima/DecimalUtils'
  s.authors      =  'Dmitriy Zakharkin' => 'mail@zdima.net'
  s.summary      = 'Utility functions to allow direct manipulation with NSDecimal'

# Source Info
  s.platform     =  :ios, '<#iOS Platform#>'
  s.source       =  :git => 'https://github/zdima/DecimalUtils', :tag => 'VERSION0100'
  s.source_files = 'DecimalUtils/DecimalUtils.*'
  s.requires_arc = true
  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '6.0'
  
end