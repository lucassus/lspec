require 'test/helper'

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
