module LSpec

  module Matchers

    class Base
      attr_reader :expected

      def initialize(expected)
        @expected = expected
      end

      private

      def raise_assertion_error_unless(condition)
        raise AssertionError unless condition
      end
    end

    class EqualMatcher < Base
      def matches?(actual)
        raise_assertion_error_unless(actual == expected)
      end
    end

    class Include < Base
      def matches?(actual)
        raise_assertion_error_unless(actual.include?(expected))
      end
    end

    def eq(expected)
      EqualMatcher.new(expected)
    end

    def include(expected)
      Include.new(expected)
    end

  end

end
