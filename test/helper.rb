require 'test/unit'

$:.push File.expand_path("../../lib", __FILE__)
require 'lspec'

begin
  require 'debugger'
rescue LoadError
  STDERR.puts 'debugger in not available for ruby < 1.9 and jruby'
end
