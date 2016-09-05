Gem::Specification.new do |s|
  s.name = "holla-sidekiq"
  s.version = "0.0.1"
  s.summary = "Holla middleware for Sidekiq."
  s.description  = "Holla middleware for Sidekiq."
  s.homepage = "http://github.com/lidcore/holla-sidekiq"
  s.email = "it@lidcore.com"
  s.has_rdoc = false
  s.authors  = ["Neil Mock"]
  s.files = %w[
README.md
holla-sidekiq.gemspec
lib/sidekiq/middleware/client/holla.rb
lib/sidekiq/middleware/server/holla.rb
]
  s.add_dependency "bunny", "2.5.1"
end
