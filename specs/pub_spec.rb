require("minitest/autorun")
require("minitest/pride")
require_relative("../Drink.rb")
require_relative("../Customer.rb")
require_relative("../Pub.rb")

class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4, 3)
    @drink2 = Drink.new("Cider", 3, 2)
    @drink3 = Drink.new("Wine", 5, 4)

    @stock = [
      {
        bev: @drink1,
        quantity: 6
      },
      {
        bev: @drink2,
        quantity: 12
      },
      {
        bev: @drink3,
        quantity: 6
        }
      ]

    @pub = Pub.new("The Winchester", 1000, @stock)

    @customer1 = Customer.new("Kevin", 10, 29)
    @customer2 = Customer.new("Nathan", 20, 27)
    @customer3 = Customer.new("Niall", 50, 16)

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

  def test_stock_count()
    assert_equal(24, @pub.stock_count())
  end

  def test_increase_till()
    @pub.increase_till(@drink3)
    assert_equal(1005, @pub.till())
  end

  def test_check_age__true()
    assert_equal(true, @pub.check_age(@customer1))
  end

  def test_check_age__false()
    assert_equal(false, @pub.check_age(@customer3))
  end

end
