module LSpec

  module Matchers

    class Base
      attr_reader :expected

      def initialize(expected)
        @expected = expected
      end

      private

      def check!(passes)
        raise AssertionError unless passes
      end
    end

    class EqualMatcher < Base
      def matches?(actual)
        check!(actual == expected)
      end
    end

    class Include < Base
      def matches?(actual)
        check!(actual.include?(expected))
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
