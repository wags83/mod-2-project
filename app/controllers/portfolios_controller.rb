class PortfoliosController < ApplicationController
    def index
        @portfolios = Portfolio.all
        @investments = Investment.all
        @users = User.all
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        @comment = Comment.new
        @users = User.all
    end

    def new
        @portfolio = Portfolio.new
        if current_user
            render :new
        else
            redirect_to @portfolio 
        end

    end

    def create
        @portfolio = Portfolio.new(portfolio_name: params[:portfolio_name], user_id: params[:user_id], initial_cash: params[:initial_cash], current_cash: params[:initial_cash])
        if @portfolio.save
        flash[:success] = "Portfolio successfully created"
        redirect_to @portfolio
        else
        flash[:error] = "Something went wrong"
        redirect_to new_portfolio_path
        end
    end


    def destroy
        @portfolio = Portfolio.find(params[:id])
        @portfolio.destroy
    
        redirect_to user_path(current_user.id)
    end



end
