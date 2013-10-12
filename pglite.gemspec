Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'pglite'
  s.version     = 1
  s.summary     = 'Execute postgresql queries via psql command line utility'
  s.description = 'Execute postgresql queries via psql with a little sugar.  This gem provides a class that lets you set some common command line options once and execute against a faux-connection.'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.11'

  s.license = 'GPLv2'

  s.author   = 'Robert Berry'
  s.email    = 'berrydigital@gmail.com'
  s.homepage = 'http://no0p.github.io'

  s.files = ['README.md', 'pglite.rb']
end
