class InvestmentsController < ApplicationController
    def index
        @investments = Investment.all

    end

    def show
        @investment = Investment.find(params[:id])
        @portfolio = Portfolio.find(params[:portfolio_id])
    end

    def new
        @investment = Investment.new
        @portfolio = Portfolio.find(params[:portfolio_id])
    end
        ####Should refactor to reduce API calls, can discuss tomorrow.
    def create
        # byebug
        @portfolio = Portfolio.find(params[:portfolio_id])
        @portfolio.validate_buy(investment_params[:symbol], investment_params[:num_shares])
        @investment = Investment.new(investment_params)
        @investment.update(purchase_price: MyHelper.get_current_stock_price(investment_params[:symbol]),current_price: MyHelper.get_current_stock_price(investment_params[:symbol]), purchase_date: MyHelper.current_date_to_YYYYMMDD, portfolio_id: params[:portfolio_id])
        new_balance = @portfolio.current_cash - (investment_params[:num_shares].to_f*MyHelper.get_current_stock_price(investment_params[:symbol]))
        @portfolio.update(current_cash: new_balance)
        redirect_to @portfolio
    end

    def edit
        @investment = Investment.find(params[:id])
    end

    def sell
        @investment = Investment.find(params[:id])
    end

    def update
        @investment = Investment.find(params[:id])
        @investment.update(investment_params)
        
        redirect_to investment_path(@investment.id)
    end

    def destroy
        @investment = Investment.find(params[:id])
        @investment.destroy
    
        redirect_to investments_path
    end


    private

    def investment_params
        params.require(:investment).permit(:symbol, :num_shares, :portfolio_id)
        # :purchase_price, :current_price, :purchase_date, :portfolio_id
    end


end
