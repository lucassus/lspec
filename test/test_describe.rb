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

  def test_that_subject_should_have_an_alias
    assert_raise(IndexError) do
      describe 'Some thing' do
        context 'other thing' do
          it 'should fail when an alias is defined' do
            raise IndexError
          end
        end
      end
    end
  end

  def test_that_it_should_have_an_alias
    assert_raise(IndexError) do
      describe 'Some thing' do
        context 'other thing' do
          specify 'this should have fail' do
            raise IndexError
          end
        end
      end
    end
  end
end
