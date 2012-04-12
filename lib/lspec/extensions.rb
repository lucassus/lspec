module Kernel
  def describe(desc_or_class, &block)
    LSpec::ExampleGroup.new(desc_or_class, block).evaluate!
  end
end

class Object
  def should(mather = nil)
    assertion = LSpec::DelayedAssertion.new(self)
    mather.nil? ? assertion : assertion.check_against(mather)
  end
end
