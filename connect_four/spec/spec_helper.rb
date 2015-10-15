#spec_helper.rb
require './lib/connect_four'
require './lib/player'

RSpec.configure do |config|
  config.formatter = :documentation
end