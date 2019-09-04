class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def reduce_wallet(drink)
    @wallet -= drink.get_price()
  end

  def buys_drink(drink,pub)
    reduce_wallet(drink)
    pub.increase_till(drink)
  end

  def get_age()
    return @age
  end

  def get_drunkenness()
    return @drunkenness
  end

end
