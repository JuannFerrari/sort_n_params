Gem::Specification.new do |s|
  s.name        = 'sort_n_params'
  s.version     = '1.0.0'
  s.date        = '2019-05-07'
  s.summary     = "Sort N Params"
  s.description = "Make your html <tables> sortables with N <th> parameters this gem."
  s.authors     = ["Juan Francisco Ferrari"]
  s.email       = 'juannferrari@gmail.com'
  s.files       = ["lib/sort_n_params.rb"]
  s.homepage    =
    'https://github.com/JuannFerrari/sort_n_params'
  s.license       = 'MIT'


  s.add_development_dependency "bundler"
  s.add_development_dependency "factory_bot", "~> 4.0"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"

  s.add_dependency(%q<rails>.freeze, ["~> 5.0"])
  s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
  s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
end
