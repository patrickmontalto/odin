#spec_helper.rb
require './lib/connect_four'
require './lib/player'

RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    # Redirect stderr and stdout
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
  config.formatter = :documentation
end