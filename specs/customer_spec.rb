require("minitest/autorun")
require("minitest/pride")
require_relative("../Drink.rb")
require_relative("../Customer.rb")
require_relative("../Pub.rb")

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Kevin", 10)
    @customer2 = Customer.new("Nathan", 20)

    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Cider", 3)
    @drink3 = Drink.new("Wine", 5)

    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Winchester", 1000, @drinks)

  end

  def test_customer_has_name()
    assert_equal("Kevin", @customer1.name())
  end

  def test_customer_has_wallet()
    assert_equal(20, @customer2.wallet())
  end

  def test_reduce_wallet()
    @customer1.reduce_wallet(@drink2)
    assert_equal(7, @customer1.wallet())
  end

  def test_customer_buys_drink()
    @customer1.buys_drink(@drink2, @pub)
    assert_equal(7, @customer1.wallet())
    assert_equal(1003, @pub.till())
  end

end
