class PortfoliosController < ApplicationController
    def index
        @portfolios = Portfolio.all
        @investments = Investment.all
        render :index
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        @comment = Comment.new
    end

    def new
        @portfolio = Portfolio.new
    end

    def create
        @portfolio = Portfolio.create(portfolio_params)

        redirect_to @portfolio
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
    
        redirect_to portfolios_path
    end



    private

    def portfolio_params
        params.require(:portfolio).permit(:initial_cash, :current_cash, :porfolio_name, :user_id)
      end

end
