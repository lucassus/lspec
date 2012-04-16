$: << File.expand_path('../..', __FILE__)
require 'test/helper'

Dir['test/test_*.rb'].each do |test_file|
  require test_file
end
