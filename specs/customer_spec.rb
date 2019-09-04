require("minitest/autorun")
require("minitest/pride")
require_relative("../Drink.rb")
require_relative("../Customer.rb")
require_relative("../Pub.rb")

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Kevin", 10, 29)
    @customer2 = Customer.new("Nathan", 20, 27)
    @customer3 = Customer.new("Niall", 50, 16)

    @drink1 = Drink.new("Beer", 4, 3)
    @drink2 = Drink.new("Cider", 3, 2)
    @drink3 = Drink.new("Wine", 5, 4)

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

  def test_customer_buys_drink__legal()
    @customer1.buys_drink(@drink2, @pub, @customer1)
    assert_equal(7, @customer1.wallet())
    assert_equal(1003, @pub.till())
    assert_equal(2, @customer1.drunkenness())
  end

  def test_customer_buys_drink__illegal()
    assert_equal("Too young! Get out!", @customer3.buys_drink(@drink2, @pub, @customer3))
    assert_equal(50, @customer3.wallet())
    assert_equal(1000, @pub.till())
    assert_equal(0, @customer3.drunkenness())
  end

  def test_get_age()
    assert_equal(29, @customer1.age())
  end

  def test_get_drunkenness()
    assert_equal(0, @customer2.drunkenness())
  end

  def test_increase_drunkenness()
    @customer1.increase_drunkenness(@drink1)
    assert_equal(3, @customer1.drunkenness())
  end

  # def test_check_age__true()
  #   assert_equal(true, @customer1.check_age())
  # end
  #
  # def test_check_age__false()
  #   assert_equal(false, @customer3.check_age())
  # end

  def test_customer_is_drunk()
    @customer1.buys_drink(@drink3, @pub, @customer1)
    @customer1.buys_drink(@drink3, @pub, @customer1)
    @customer1.buys_drink(@drink3, @pub, @customer1)
    result = @customer1.buys_drink(@drink3, @pub, @customer1)
    assert_equal("Too drunk! Get out!", result)
  end

  def test_customer_is_not_drunk()
    @customer1.buys_drink(@drink3, @pub, @customer1)
    @customer1.buys_drink(@drink3, @pub, @customer1)
    result = @customer1.buys_drink(@drink3, @pub, @customer1)
    assert_equal(12, result)
  end

end
