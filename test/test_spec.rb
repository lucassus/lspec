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

