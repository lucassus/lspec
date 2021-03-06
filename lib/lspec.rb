require "lspec/version"
require "lspec/extensions"

module LSpec
  autoload :AssertionError, "lspec/assertion_error"
  autoload :DelayedAssertion, "lspec/delayed_assertion"
  autoload :ExampleGroup, "lspec/example_group"
  autoload :Example, "lspec/example"
  autoload :Matchers, "lspec/matchers"
end
