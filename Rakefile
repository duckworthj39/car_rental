begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = "--format documentation"
  end
rescue LoadError
  # no rspec available
end