require("minitest/autorun")
require("minitest/pride")
require_relative("../Drink.rb")

class TestDrink < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4, 3)
    @drink2 = Drink.new("Cider", 3, 2)
    @drink3 = Drink.new("Wine", 5, 4)

  end

  def test_drink_has_name()
    assert_equal("Beer", @drink1.name())
  end

  def test_drink_has_price()
    assert_equal(3, @drink2.get_price())
  end

  def test_get_alcohol_level()
    assert_equal(4, @drink3.get_alcohol_level())
  end

end
