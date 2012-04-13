require 'test/helper'

class TestAssertions < Test::Unit::TestCase
  def test_equal_assertion_can_pass
    2.should == 2
  end

  def test_equal_assertion_can_fail
    assert_raise(LSpec::AssertionError) do
      1.should == 2
    end
  end
end
