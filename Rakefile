require 'bundler'
require 'rake/testtask'

Bundler::GemHelper.install_tasks(:name => 'anyplayer')

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb']
end
