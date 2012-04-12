require 'test/unit'
require 'spec'

class TestDescribe < Test::Unit::TestCase
  def test_that_it_can_pass
    describe('some thing') do
      it 'should do something' do
      end
    end
  end

  def test_that_it_can_fail
    assert_raise(IndexError) do
      describe 'some failing thing' do
        it 'fails' do
          raise IndexError
        end
      end
    end
  end
end

class TestAssertions < Test::Unit::TestCase
  def test_it_can_pass
    2.should == 2
  end
end

