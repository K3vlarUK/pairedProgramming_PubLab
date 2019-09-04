class Customer
#useful comment
  attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def reduce_wallet(drink)
    @wallet -= drink.get_price()
  end

  def increase_drunkenness(drink)
    @drunkenness += drink.get_alcohol_level()
  end

  def buys_drink(drink,pub,customer)
    if pub.check_age(customer) == true
      # if (@drunkenness + drink.get_alcohol_level()) < 10
      if @drunkenness < 10
        reduce_wallet(drink)
        pub.increase_till(drink)
        increase_drunkenness(drink)
      else
        return "Too drunk! Get out!"
      end
    else
      return "Too young! Get out!"
    end
  end

  def decrease_drunkenness(food)
    @drunkenness -= food.get_rejuvenation_level()
  end

  def buys_food(food)
    decrease_drunkenness(food)
    reduce_wallet(food)
  end

end
