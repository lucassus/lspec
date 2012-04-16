module LSpec

  class Example
    attr_reader :desc
    attr_reader :block

    def initialize(desc, block)
      @desc = desc
      @block = block
    end

    def evaluate!
      block.call
    end
  end

end
