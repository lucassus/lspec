module Kernel
  def describe(desc_or_class, &block)
    LSpec::ExampleGroup.new(desc_or_class, block).evaluate!
  end
end

class Object
  def should(matcher = nil)
    assertion = LSpec::DelayedAssertion.new(self)
    matcher.nil? ? assertion : assertion.check_against(matcher)
  end
end
