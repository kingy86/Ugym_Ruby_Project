require("minitest/autorun")
require("minitest/rg")
require_relative("../member.rb")

class TestMember < MiniTest::Test

  def setup
    options = {'first_name' => 'Ross', 'last_name' => 'Greer', 'age' => 24, 'fitness_level' => 3}

    @member = Member.new(options)
  end

  def test_member_has_first_name
    result = @member.first_name()
    assert_equal('Ross', result)
  end

  def test_member_has_last_name
    result = @member.last_name()
    assert_equal('Greer', result)
  end

  def test_member_has_age
    result = @member.age()
    assert_equal(24, result)
  end

  def test_member_has_fitness_level
    result = @member.fitness_level()
    assert_equal(3, result)
  end


end
