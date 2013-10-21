task :default => [:test]

task :test do
  cmd = 'rspec spec'
  puts "Starting to run `#{cmd}`..."
  system("export DISPLAY=:99.0 && bundle exec #{cmd}")
  raise "`#{cmd}` failed!" unless $?.exitstatus == 0
end
