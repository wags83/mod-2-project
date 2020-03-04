class PortfoliosController < ApplicationController
    def index
        @portfolios = Portfolio.all
        @investments = Investment.all
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        @comment = Comment.new
    end

    def new
        @portfolio = Portfolio.new
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

    def edit
        @portfolio = Portfolio.find(params[:id])
    end

    def update
        @portfolio = Portfolio.find(params[:id])
        @portfolio.update(portfolio_params)

        redirect_to portfolio_path(@portfolio.id)
    end

    def destroy
        @portfolio = Portfolio.find(params[:id])
        @portfolio.destroy
    
        redirect_to user_path(current_user.id)
    end





end
