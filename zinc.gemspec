spec = Gem::Specification.new do |s|
	s.name = 'zinc'
	s.version = '0.1.0'
	s.summary = 'Ruby bindings for the Zinc(https://zinc.io) API'
	s.description = s.summary
	s.authors = ['Julian Simioni']
	s.email = ['julian.simioni@gmail.com']

	s.add_dependency('rest-client', '~> 1.4')

	s.add_development_dependency('rspec')
	s.add_development_dependency('rake')

	s.files = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- spec/*`.split("\n")
	s.require_paths = ['lib']
end
