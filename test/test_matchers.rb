require 'test/helper'

class TestMatchers < Test::Unit::TestCase
  include LSpec::Matchers

  def test_eq_assertion_can_pass
    2.should eq(2)
  end

  def test_eq_assertion_can_fail
    assert_raise(LSpec::AssertionError) do
      1.should eq(2)
    end
  end

  def test_include_assertion_can_pass
    [1, 2, 3].should include(1)
    [1, 2, 3].should include(2)
    [1, 2, 3].should include(3)
  end

  def test_include_assertion_can_fail
    assert_raise(LSpec::AssertionError) do
      [1, 2, 3].should include(9)
    end
  end
end
