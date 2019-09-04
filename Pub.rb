class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def drinks_menu()
    return @drinks.length()
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

end
