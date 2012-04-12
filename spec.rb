module Kernel
  def describe(description, &block)
    ExampleGroup.new(block).evaluate!
  end
end

class ExampleGroup
  attr_reader :block

  def initialize(block)
    @block = block
  end

  def evaluate!
    instance_eval(&block)
  end

  def it(description, &block)
    block.call
  end

  def before(&block)
    instance_eval(&block)
  end

  def let(name, &block)
    # Define helper :let method on the objec's singleton (eigen) class
    eigenclass = (class << self; self; end)
    eigenclass.send :define_method, name do
      @let_memoized_values ||= {}
      @let_memoized_values[name] ||= block.call
    end
  end
end

class Object
  def should
    DelayedAssertion.new(self)
  end
end

class AssertionError < Exception; end

class DelayedAssertion
  attr_reader :subject

  def initialize(subject)
    @subject = subject
  end

  def ==(other)
    raise AssertionError unless subject == other
  end
end

