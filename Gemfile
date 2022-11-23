source "http://rubygems.org"

ruby File.read(".ruby-version").strip

gem "sinatra"

group :production do
  gem "unicorn"
end

group :development, :test do
  gem "rack-test"
  gem "rake"
  gem "rspec"
  gem "shotgun"
  gem "simplecov"
end
