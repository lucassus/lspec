module Kernel
  def describe(desc_or_class, &block)
    LSpec::ExampleGroup.new(desc_or_class, nil, block).evaluate!
  end
end

class Object
  def should(matcher = nil)
    assertion = LSpec::DelayedAssertion.new(self)
    matcher.present? ? assertion.check_against(matcher) : assertion
  end

  unless respond_to?(:present?)
    define_method :present? do
      self != nil
    end
  end
end
