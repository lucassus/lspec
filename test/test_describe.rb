require 'test/helper'

class TestDescribe < Test::Unit::TestCase
  def test_that_it_can_pass
    describe 'some thing' do
      it 'should do something' do
      end
    end
  end

  def test_that_it_can_fail
    assert_raise(IndexError) do
      describe 'Some failing thing' do
        it 'fails' do
          raise IndexError
        end
      end
    end
  end

  def test_that_describe_blocks_can_be_nested
    assert_raise(IndexError) do
      describe 'Some thing' do
        describe 'other thing' do
          it 'fails' do
            raise IndexError
          end
        end
      end
    end
  end
end
