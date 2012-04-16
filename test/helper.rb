require 'test/unit'

$:.push File.expand_path("../../lib", __FILE__)
require 'lspec'

begin
  require 'debugger'
rescue
  puts 'debugger in not available'
end
