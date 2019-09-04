require("minitest/autorun")
require("minitest/pride")
require_relative("../Drink.rb")
require_relative("../Customer.rb")

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Kevin", 10)
    @customer2 = Customer.new("Nathan", 20)

  end

  def test_customer_has_name()
    assert_equal("Kevin", @customer1.name())
  end

  def test_customer_has_wallet()
    assert_equal(20, @customer2.wallet())
  end

end
