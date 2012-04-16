module LSpec

  class DelayedAssertion
    attr_reader :subject

    def initialize(subject)
      @subject = subject
    end

    def check_against(matcher)
      matcher.matches?(subject)
    end

    def ==(other)
      raise AssertionError.new("Expected #{subject.inspect} to be equal to #{other.inspect}") unless subject == other
    end
  end

end
