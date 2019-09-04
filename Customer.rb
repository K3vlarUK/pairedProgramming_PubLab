class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def reduce_wallet(drink)
    @wallet -= drink.get_price()
  end

  def buys_drink(drink,pub)
    reduce_wallet(drink)
    pub.increase_till(drink)
  end

end
