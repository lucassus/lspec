def describe(description, &block)
  block.call
end

def it(description)
  raise IndexError
end
