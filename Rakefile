require 'rubocop/rake_task'

task default: %w[lint test]

task :run do
  ruby 'lib/routes.rb'
end

task :test do
  ruby 'test/spotify_test.rb'
end


RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = %w[lib/**/*.rb test/**/*.rb]
  task.fail_on_error = false
end
