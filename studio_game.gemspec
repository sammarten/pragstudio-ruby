Gem::Specification.new do |s|
  s.name         = "stm_studio_game"
  s.version      = "1.0.0"
  s.author       = "Sam Marten"
  s.email        = "sammarten@gmail.com"
  s.homepage     = ""
  s.summary      = "Game where players earn health and treasure."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end