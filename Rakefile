require 'rubocop/rake_task'

task default: %w[lint test]

task :start do
  sh 'puma' # -t 8:32 -w 3'
end

task :test do
  ruby 'test/*_test.rb'
end


RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = %w[lib/*.rb test/*.rb]
  task.fail_on_error = false
end
