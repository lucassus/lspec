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
end
