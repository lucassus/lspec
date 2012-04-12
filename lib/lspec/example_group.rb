module LSpec

  class ExampleGroup
    attr_reader :block
    attr_reader :desc_or_class

    def initialize(desc_or_class, block)
      @desc_or_class = desc_or_class
      @block = block
    end

    def evaluate!
      instance_eval(&block)
    end

    def subject
      @subject ||= begin
        if block_given?
          yield
        elsif desc_or_class.is_a?(Class)
          desc_or_class.new
        end
      end
    end

    def it(desc, &block)
      Example.new(desc, block).evaluate!
    end

    def before(&block)
      instance_eval(&block)
    end

    def let(name, &block)
      # Define helper :let method on the objec's singleton (eigen) class
      singleton_class = (class << self; self; end)
      singleton_class.send :define_method, name do
        @let_memoized_values ||= {}
        @let_memoized_values[name] ||= block.call
      end
    end
  end
end
