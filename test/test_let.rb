require 'test/helper'

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

  def test_that_it_should_be_accessible_in_the_nested_scope
    describe 'Something with let' do
      let(:bar) { 'bar' }

      describe 'nested scope' do
        it 'should be accessible here' do
          bar.should == 'bar'
        end

        describe 'even more nested' do
          it 'should still be equal the same value' do
            bar.should == 'bar'
          end
        end
      end
    end
  end

  def test_that_it_can_be_overridden_in_the_nested_scope
    describe 'Something with let' do
      let(:bar) { 'bar' }

      describe 'nested scope' do
        it 'should be accessible here' do
          bar.should == 'bar'
        end

        describe 'even more nested' do
          let(:bar) { 'foo' }

          it 'should be overridden' do
            bar.should == 'foo'
          end
        end
      end
    end
  end

  def test_that_it_can_be_used_in_other_let
    describe 'A scope' do
      let(:bar) { 'bar' }
      let(:foobar) { "foo#{bar}" }
      subject { foobar }

      it 'should be equal foobar' do
        subject.should == 'foobar'
      end
    end
  end

  def test_that_it_can_be_used_along_with_before
    describe 'A scope' do
      let(:foo) { 'bar' }
      before do
        @bar = foo
      end

      it 'should equal bar' do
        @bar.should == 'bar'
      end
    end
  end
end
