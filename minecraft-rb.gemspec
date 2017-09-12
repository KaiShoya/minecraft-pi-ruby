$:.push File.expand_path("../lib", __FILE__)
Gem::Specification.new do |s|
	s.name = 'minecraft-rb'
	s.description = 'Control Minecraft using the Ruby programming language.'
	s.version = '0.0.1'
	s.date = '2017-09-12'
	s.summary = 'Minecraft Ruby'
	s.homepage = 'https://github.com/KaiShoya/minecraft-rb'
	s.authors = ["Kai Shoya"]
	s.email = ["shonari77@gmail.com"]
	s.files = `git ls-files`.split("\n")
end
