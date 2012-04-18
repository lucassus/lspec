require 'test/helper'

class TestFormatter < Test::Unit::TestCase
  def test_that_it_will_display_full_description
    first_example_group = nil
    second_example_group = nil
    describe Array do
      first_example_group = context 'which is nested' do
        second_example_group = context 'and has some values' do
        end
      end
    end

    assert_equal first_example_group.full_description, 'Array which is nested'
    assert_equal second_example_group.full_description, 'Array which is nested and has some values'
 end
end
