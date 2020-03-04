class User < ApplicationRecord
    has_secure_password
    has_many :portfolios, dependent: :destroy
    has_many :investments, through: :portfolios
    has_many :comments, dependent: :destroy

    # attr_reader :password 

    # def password=(plain_text_pw)
    #     self.password_digest = BCrypt::Password.create(plain_text_pw)
    # end

    # def authenticate(pt_pw)
    #     if BCrypto::Password.new(self.password_digest) == pt_pw
    #         @user
    #     else
    #         false
    #     end
    # end

end
