source "http://rubygems.org"

ruby "2.5.1"

gem "sinatra"

group :production do
  gem "unicorn"
end

group :development, :test do
  gem "rake"
  gem "rspec"
  gem "rack-test"
  gem "simplecov"
  gem "shotgun"
end
