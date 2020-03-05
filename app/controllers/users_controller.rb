class UsersController < ApplicationController
    def index
        @users = User.all
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

    def new
        byebug
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end
end
