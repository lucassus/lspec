module LSpec

  module Matchers

    class EqualMatcher
      attr_reader :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        raise AssertionError unless actual == expected
      end
    end

    class Include
      attr_reader :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        raise AssertionError unless actual.include?(expected)
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
