Gem::Specification.new do |s|
  s.name        = 'sort_n_params'
  s.version     = '1.2.1'
  s.date        = '2022-06-17'
  s.summary     = 'Sort N Params'
  s.description = 'Make your html <tables> sortables with N <th> parameters this gem.'
  s.authors     = ['Juan Francisco Ferrari']
  s.email       = 'juannferrari@gmail.com'
  s.require_paths = ['lib']
  s.files = [
    'Gemfile',
    'LICENSE',
    'Rakefile',
    'sort_n_params.gemspec',
    'lib/sort_n_params.rb',
    'lib/sort_n_params/sortable.rb',
    'lib/sort_n_params/sort_helpers.rb',
    'lib/sort_n_params/concerns/scopes.rb',
    'spec/concerns/scopes_spec.rb',
    'spec/spec_helper.rb',
    'spec/sortable_spec.rb'
  ]
  s.homepage =
    'https://github.com/JuannFerrari/sort_n_params'
  s.license = 'MIT'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'factory_bot', '~> 4.0'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'rake', '>= 12.3.3'
  s.add_development_dependency 'rspec', '~> 3.0'

  s.add_dependency('rails'.freeze, ['>= 7.0'])
  s.add_dependency('nokogiri'.freeze, ['>= 0'])
  s.add_dependency('rake'.freeze, ['>= 12.3.3'])
end
