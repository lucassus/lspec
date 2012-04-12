module Kernel
  def describe(description, &block)
    LSpec::ExampleGroup.new(block).evaluate!
  end
end

class Object
  def should
    LSpec::DelayedAssertion.new(self)
  end
end
