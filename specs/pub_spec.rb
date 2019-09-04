require("minitest/autorun")
require("minitest/pride")
require_relative("../Drink.rb")
require_relative("../Customer.rb")
require_relative("../Pub.rb")

class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Cider", 3)
    @drink3 = Drink.new("Wine", 5)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Winchester", 1000, @drinks)

  end

  def test_pub_has_name()
    assert_equal("The Winchester", @pub.name())
  end

  def test_pub_has_till()
    assert_equal(1000, @pub.till())
  end

  def test_pub_has_drinks()
    assert_equal(3, @pub.drinks_menu())
  end

  def test_increase_till()
    @pub.increase_till(@drink3)
    assert_equal(1005, @pub.till())
  end

end
