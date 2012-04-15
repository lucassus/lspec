require 'test/helper'

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

  def test_that_it_could_set_explicit_subject
    describe Array do
      subject { [1, 2, 3] }

      it 'sets an explicit subject' do
        subject.should == [1, 2, 3]
      end
    end
  end

  def test_that_it_should_be_accessible_in_the_nested_scope
    describe Array do
      subject { [1, 2, 3] }

      describe '#size' do
        it 'returns correct array size' do
          subject.size.should == 3
        end
      end
    end
  end

  def test_that_it_could_be_overriden_in_the_nested_scope
    describe Array do
      subject { [1, 2] }

      describe '#size' do
        subject { [1, 2, 4] }

        it 'returns correct array size' do
          subject.size.should == 3
        end

        describe 'event more nested example when an array has 5 elements' do
          subject { (1..5).to_a }

          it 'return 5' do
            subject.size.should == 5
          end
        end
      end
    end
  end
end
