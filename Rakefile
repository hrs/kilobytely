task default: [:spec]

task :spec do
  cmd = "rspec spec"
  puts "Starting to run `#{cmd}`..."
  system("export DISPLAY=:99.0 && bundle exec #{cmd}")
  if $?.exitstatus != 0
    raise "`#{cmd}` failed!"
  end
end
