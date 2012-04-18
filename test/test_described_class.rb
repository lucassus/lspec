require 'test/helper'

class TestDescribedClass < Test::Unit::TestCase

  def test_that_described_class_is_set
    describe Array do
      it 'should set #described_class' do
        described_class.should == Array
      end
    end
  end

  def test_that_described_class_should_not_be_set
    describe '' do
      it 'should not set #described_class' do
        described_class.should == nil
      end
    end
  end

  def test_that_it_should_inherit_described_class_from_the_parent_scope
    describe String do
      describe 'some behaviour in the nested scope' do
        it 'should set #described_class' do
          described_class.should == String
        end
      end
    end
  end

end
