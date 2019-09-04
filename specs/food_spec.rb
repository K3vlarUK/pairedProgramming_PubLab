require("minitest/autorun")
require("minitest/pride")
require_relative("../Food.rb")

class TestFood < MiniTest::Test

  def setup

    @food1 = Food.new("Crisps", 2, 3)
    @food2 = Food.new("Nuts", 1, 2)
    @food3 = Food.new("Pork Scratchings", 4, 5)

  end

  def test_food_has_name()
    assert_equal("Crisps", @food1.name())
  end

  def test_food_has_price()
    assert_equal(1, @food2.get_price())
  end

  def test_get_rejuvenation_level()
    assert_equal(5, @food3.get_rejuvenation_level())
  end

end
