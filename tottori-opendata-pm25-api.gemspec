# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tottori-opendata-pm25-api/version'

Gem::Specification.new do |spec|
  spec.name          = 'tottori-opendata-pm25-api'
  spec.version       = Tottori::OpenData::PM25::API::VERSION
  spec.authors       = ['Masayuki Higashino']
  spec.email         = ['mh.on.web@gmail.com']

  spec.summary       = 'Tottori Open Data PM2.5 API'
  spec.description   = 'Tottori Open Data PM2.5 API'
  spec.homepage      = 'https://github.com/code4tottori/tottori-opendata-pm25-api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
end
