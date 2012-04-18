module LSpec

  class ExampleGroup
    attr_reader :desc_or_class
    attr_reader :parent
    attr_reader :block
    attr_reader :parent

    def initialize(desc_or_class, parent, block)
      @desc_or_class = desc_or_class

      # Inherit subject from the parent ExampleGroup
      @parent = parent

      @block = block
    end

    def describe(desc_or_class, &block)
      LSpec::ExampleGroup.new(desc_or_class, self, block).evaluate!
    end

    alias :context :describe

    def evaluate!
      instance_eval(&block)
      self
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
        # If the current scope subject is not set, try to return subject from the parent scope
        @subject || parent.subject
      end
    end

    def it(desc, &block)
      Example.new(desc, block).evaluate!
    end

    alias :specify :it

    def before(&block)
      instance_eval(&block)
    end

    def let(name, &block)
      # Define helper :let method on the object's singleton (eigen) class
      singleton_class = (class << self; self; end)
      singleton_class.send :define_method, name do
        @let_memoized_let_values ||= {}
        @let_memoized_let_values[name] ||= block.call
      end
    end

    def described_class
      if desc_or_class.is_a?(Class)
        desc_or_class
      else
        parent.described_class if parent.present?
      end
    end

    def ancestors
      ancestors = [self]
      ancestors += self.parent.ancestors if self.parent
      ancestors
    end

    def full_description
      ancestors.reverse.map(&:desc_or_class).join(' ')
    end

    def method_missing(name)
      # Check whether given method is defined somewhere in the parent scope
      receiver = ancestors.find { |ancestor| ancestor.respond_to?(name) }
      if receiver.present?
        receiver.send(name)
      else
        # .. otherwise raise an error
        raise NoMemoryError, "undefined method `#{name}` for #{self.inspect}"
      end
    end
  end
end
