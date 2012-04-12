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
      raise AssertionError unless subject == other
    end
  end

end
