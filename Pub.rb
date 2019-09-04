class Pub

  attr_reader :name, :till

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock
  end

  def drinks_menu()
    return @stock.length()
  end

  def increase_till(drink)
    @till += drink.get_price()
  end

  def check_age(customer)
    if customer.age() >= 18
      return true
    elsif customer.age() < 18
      return false
    end
  end

  def stock_count()
    total_stock = 0
    for drink in @stock
      total_stock += drink[:quantity]
    end
    return total_stock
  end

  def stock_value()
    stock_total_value = 0
    for drink in @stock
      stock_total_value += (drink[:quantity] * drink[:bev].get_price())
    end
    return stock_total_value
  end

end
