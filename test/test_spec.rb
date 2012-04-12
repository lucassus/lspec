$:.push File.expand_path("../../lib", __FILE__)

require 'test/unit'
require 'lspec'

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

class TestLet < Test::Unit::TestCase
  def test_that_it_defines_a_helper_method
    describe 'Something with let' do
      let(:foo) { 'hello' }
      it 'defines :foo helper method' do
        foo.should == 'hello'
      end
    end
  end

  def test_that_let_helper_momizes_the_value
    samples = [1, 2, 3]

    describe 'Something with let' do
      let(:bar) { samples.pop }

      it 'returns 3' do
        bar.should == 3
      end

      it 'returns the same value' do
        bar.should == 3
      end
    end
  end
end

class TestSubject < Test::Unit::TestCase
  def test_that_it_should_set_implicit_subject
    describe Array do
      it 'creates a new instance of Array' do
        subject.should == []
      end
    end

    describe String do
      it 'creates a new instance of string' do
        subject.should == ''
      end
    end
  end

  def test_that_it_instantiate_described_class_only_once
    describe Array do
      it 'instantiates described class only once' do
        subject.object_id.should == subject.object_id
      end
    end
  end
end

class TestAssertions < Test::Unit::TestCase
  def test_it_can_pass
    2.should == 2
  end

  def test_it_can_fail
    assert_raise(LSpec::AssertionError) do
      1.should == 2
    end
  end
end

