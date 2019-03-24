require('minitest/autorun')
require('minitest/rg')
require_relative('../session.rb')


class TestSession < MiniTest::Test

  def setup

    options = {'name' => 'Yoga', 'intensity' => 3, 'capacity' => 5}

    @session = Session.new(options)
  end

  def test_session_has_name
    result = @session.name()
    assert_equal('Yoga', result)
  end

  def test_session_has_intensity_level
    result = @session.intensity()
    assert_equal(3, result)
  end

  def test_session_has_capacity_limit
    result = @session.capacity
    assert_equal(5, result)
  end

end
