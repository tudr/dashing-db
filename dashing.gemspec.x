# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'dashing'
  s.version     = '2.1.0'
  s.date        = '2014-05-30'
  s.executables = %w(dashing)


  s.summary     = "The exceptionally handsome dashboard framework."
  s.description = "This framework lets you build & easily layout dashboards with your own custom widgets. Use it to make a status boards for your ops team, or use it to track signups, conversion rates, or whatever else metrics you'd like to see in one spot. Included with the framework are ready-made widgets for you to use or customize. All of this code was extracted out of a project at Shopify that displays dashboards on TVs around the office."
  s.author      = "Tudor Saitoc"
  s.email       = 'tudor@saitoc.me'
  s.homepage    = 'http://agile-tundra-7117.herokuapp.com'
  s.license     = 'MIT'

  s.files = Dir['README.md', 'javascripts/**/*', 'templates/**/*','templates/**/.[a-z]*', 'lib/**/*']

  s.add_dependency('sass', '>= 3.2.12')
  s.add_dependency('coffee-script', '>= 2.2.0')
  s.add_dependency('execjs', '>= 2.0.2')
  s.add_dependency('sinatra', '>= 1.4.4')
  s.add_dependency('sinatra-contrib', '>= 1.4.2')
  s.add_dependency('thin', '>= 1.6.1')
  s.add_dependency('rufus-scheduler', '>= 2.0.24')
  s.add_dependency('thor', '>= 0.18.1')
  s.add_dependency('sprockets', '>= 2.10.1')
  s.add_dependency('rack', '>= 1.5.4')

  s.add_development_dependency('rake', '>= 10.1.0')
  s.add_development_dependency('haml', '>= 4.0.4')
  s.add_development_dependency('minitest', '>= 5.2.0')
  s.add_development_dependency('mocha', '>= 0.14.0')
  s.add_development_dependency('fakeweb', '>= 1.3.0')
  s.add_development_dependency('simplecov', '>= 0.8.2')
  s.add_development_dependency('pg', '>= 0.18.4')

# This is only used when puma is a git dep from Bundler, so it's a little
# weird.

d = File.read(File.expand_path("../lib/puma/const.rb", __FILE__))
if d =~ /VERSION = "(\d+\.\d+\.\d+)"/
  version = $1
else
  version = "0.0.1"
end


  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = `git log --pretty="%ai" -n 1`.split(" ").first
  s.executables = ["puma", "pumactl"]
  s.extensions = ["ext/puma_http11/extconf.rb"]
  s.files = `git ls-files`.split($/)
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "puma"
  s.rubygems_version = "1.8.25"

  s.test_files = s.files.grep(/^test/)

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.8.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.6"])
    else
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.8.0"])
      s.add_dependency(%q<hoe>, ["~> 3.6"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.8.0"])
    s.add_dependency(%q<hoe>, ["~> 3.6"])
  end
end
