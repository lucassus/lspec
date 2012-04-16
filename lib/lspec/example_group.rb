module LSpec

  class ExampleGroup
    attr_reader :desc_or_class
    attr_reader :block

    def initialize(desc_or_class, parent, block)
      @desc_or_class = desc_or_class
      @subject = parent.subject unless parent.nil?
      @block = block
    end

    def describe(desc_or_class, &block)
      LSpec::ExampleGroup.new(desc_or_class, self, block).evaluate!
    end

    def evaluate!
      instance_eval(&block)
    end

    def subject
      if block_given?
        # Evaluate the new subject
        @subject = yield
      elsif desc_or_class.is_a?(Module)
        # Instantiate the explicit subject
        @subject ||= begin
          desc_or_class.is_a?(Class) ?
              # Try instantiate the class
              desc_or_class.new :
              # ..or just return a module
              desc_or_class
        end
      else
        @subject
      end
    end

    def it(desc, &block)
      Example.new(desc, block).evaluate!
    end

    def before(&block)
      instance_eval(&block)
    end

    def let(name, &block)
      # Define helper :let method on the object's singleton (eigen) class
      singleton_class = (class << self; self; end)
      singleton_class.send :define_method, name do
        @let_memoized_values ||= {}
        @let_memoized_values[name] ||= block.call
      end
    end
  end
end
