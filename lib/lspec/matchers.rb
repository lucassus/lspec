module LSpec

  module Matchers

    class Equal
      attr_reader :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        raise AssertionError unless actual == expected
      end
    end

    def eq(expected)
      Equal.new(expected)
    end

  end

end
