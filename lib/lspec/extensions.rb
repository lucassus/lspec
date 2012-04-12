module Kernel
  def describe(desc_or_class, &block)
    LSpec::ExampleGroup.new(desc_or_class, block).evaluate!
  end
end

class Object
  def should
    LSpec::DelayedAssertion.new(self)
  end
end
