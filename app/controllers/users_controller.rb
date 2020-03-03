class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def welcome
        portfolios = Portfolio.all 
        pl_array = portfolios.map {|p| [p.portfolio_pl_ratio, p.user_id]}
        @sorted = pl_array.sort{|b,a| a[0] <=> b[0]}.slice(0,5)

        users = User.all
        user_portfolios = users.map do |user| 
            if user.portfolios.first 
                [((user.portfolios.map {|portfolio|portfolio.portfolio_pl_ratio}.sum)/user.portfolios.count), user.id]
            else
                -1
            end
        end
        @users_ports_sorted = user_portfolios.sort{|b,a| a[0] <=> b[0]}.slice(0,5)


        
        render 'users/welcome'
    end

    def show
        @user = User.find(params[:id])
    end
    
end
