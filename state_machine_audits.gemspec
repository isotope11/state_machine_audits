# -*- encoding: utf-8 -*-
require File.expand_path("../lib/state_machine_audits/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "state_machine_audits"
  s.version     = StateMachineAudits::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Josh Adams', 'Nick Fine', 'Adam Dill']
  s.email       = ['josh@isotope11.com']
  s.homepage    = "http://rubygems.org/gems/state_machine_audits"
  s.summary     = "Audits for the state_machine gem"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "state_machine_audits"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
  s.add_development_dependency "rspec", "~> 2.4.0"
  s.add_development_dependency "sqlite3", "~> 1.3.3"

  s.add_dependency 'rails', '>= 3.0.0'
  s.add_dependency 'state_machine', '~> 1.0.2'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
