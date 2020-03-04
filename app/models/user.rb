class User < ApplicationRecord
    has_secure_password
    has_many :portfolios, dependent: :destroy
    has_many :investments, through: :portfolios
    has_many :comments, dependent: :destroy
    validates :username, uniqueness: true
    validates :email, uniqueness: true

<<<<<<< HEAD
    # attr_reader :password 
=======
    # attr_reader :password
>>>>>>> 73c28612c4b2e502e617836a489a6140389a6156

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
