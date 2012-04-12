module LSpec

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
end
