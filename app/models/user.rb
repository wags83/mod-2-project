class User < ApplicationRecord
    #has_secure_password
    has_many :portfolios, dependent: :destroy
    has_many :investments, through: :portfolios
    has_many :comments, dependent: :destroy

    attr_reader :password_text 

    def password_text=(plain_text_pw)
        self.password = BCrypt::Password.create(plain_text_pw)
    end

    def authenticate(pt_pw)
        if BCrypto::Password.new(self.password) == pt_pw
            @user
        else
            false
        end
    end

    def create_portfolio(p_name, initial_cash)
        Portfolio.create(user_id: self.id, portfolio_name: p_name, initial_cash: initial_cash, current_cash: initial_cash)
    end

end
