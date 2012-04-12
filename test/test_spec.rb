require 'test/unit'
require 'spec'

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

class TestBefore < Test::Unit::TestCase
  def test_that_before_sets_an_instance_variable
    describe 'Before block' do
      before do
        @something = 123
      end

      it 'sets an instance variable' do
        @something.should == 123
      end
    end
  end

  def test_that_before_sets_an_instance_variable_only_within_its_scope
    describe 'Some thing' do
      it 'not sets instance variable' do
        @something.should == nil
      end

      describe 'nested thing' do
        before do
          @something = 456
        end

        it 'sets instance variable' do
          @something.should == 456
        end
      end
    end
  end
end

class TestAssertions < Test::Unit::TestCase
  def test_it_can_pass
    2.should == 2
  end

  def test_it_can_fail
    assert_raise(AssertionError) do
      1.should == 2
    end
  end
end

