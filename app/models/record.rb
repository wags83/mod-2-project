class Record < ApplicationRecord
  belongs_to :portfolio
  has_one :user, through: :portfolio

  def investment_value
    self.num_shares * self.sell_price
  end

  def initial_inv_value
    self.purchase_price * self.num_shares
  end

  def investment_pl
    self.investment_value - self.initial_inv_value
  end

  def investment_pl_ratio
    (self.investment_value - self.initial_inv_value) / self.initial_inv_value * 100
  end
end
