class Investment < ApplicationRecord

    belongs_to :portfolio
    validates :num_shares, numericality: { greater_than: 0}
    # validates :num_shares, numericality: { less_than: @investment.num_shares}


    #API limits calls to 5 per minute
    def self.update_all_prices_to_current_slowly_better
        index = 0
        last_investment = Investment.all.length
        
        Investment.all.each do |investment|
            Investment.all[index].update(current_price: MyHelper.get_current_stock_price(Investment.all[index].symbol))
            index += 1
            remaining_iterations = last_investment - index
            puts "Sleeping for 12 seconds, please wait. #{remaining_iterations} iterations until finish."
            sleep(12)
        end
    end

    def investment_value
        self.num_shares * self.current_price
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
