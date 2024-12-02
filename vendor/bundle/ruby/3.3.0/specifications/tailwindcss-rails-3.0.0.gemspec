# -*- encoding: utf-8 -*-
# stub: tailwindcss-rails 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tailwindcss-rails".freeze
  s.version = "3.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 3.2.0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/rails/tailwindcss-rails", "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.date = "2024-10-15"
  s.email = "david@loudthinking.com".freeze
  s.homepage = "https://github.com/rails/tailwindcss-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.16".freeze
  s.summary = "Integrate Tailwind CSS with the asset pipeline in Rails.".freeze

  s.installed_by_version = "3.5.23".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<railties>.freeze, [">= 7.0.0".freeze])
  s.add_runtime_dependency(%q<tailwindcss-ruby>.freeze, [">= 0".freeze])
end
