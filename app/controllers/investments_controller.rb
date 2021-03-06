class InvestmentsController < ApplicationController
   
    def new
        @portfolio = Portfolio.find(params[:portfolio_id])
        @investment = Investment.new

        if current_user && current_user.id == @portfolio.user_id
        else
            redirect_to @portfolio
        end
    end
        ####Should refactor to reduce API calls, can discuss tomorrow.
    def create
        current_price = MyHelper.get_current_stock_price(investment_params[:symbol])
        @portfolio = Portfolio.find(params[:portfolio_id])
        if current_price != false
            if @portfolio.current_cash >= investment_params[:num_shares].to_i*current_price
                @investment = Investment.new(investment_params)
                @investment.update(purchase_price: current_price,current_price: current_price, purchase_date: MyHelper.current_date_to_YYYYMMDD, portfolio_id: params[:portfolio_id], symbol: @investment.symbol.upcase)
                @portfolio.update(current_cash: @portfolio.current_cash - (investment_params[:num_shares].to_f*current_price))
                redirect_to @portfolio
            else
                flash[:error] = "Sorry, you do not have enough cash in your portfolio to make this purchase."
                redirect_to @portfolio
            end
        else
            flash[:error] = "Sorry, that is not a valid stock ticker symbol"
            redirect_to @portfolio
        end
    end

    def edit
        @investment = Investment.find(params[:id])
        @portfolio = Portfolio.find(params[:portfolio_id])
        if current_user && current_user.id == @investment.user.id 

        else
            redirect_to @portfolio
        end
    end

    def update
        @investment = Investment.find(params[:id]) #need validation to ensure num_shares selected doesn't exceed # of shares avail
        current_price = MyHelper.get_current_stock_price(@investment.symbol)
        @portfolio = Portfolio.find(params[:portfolio_id])
        if investment_params[:num_shares].to_i < @investment.num_shares 
            record = Record.create(portfolio_id: @investment.portfolio_id, symbol: @investment.symbol, purchase_price: @investment.purchase_price, sell_price: current_price, sell_date: MyHelper.current_date_to_YYYYMMDD, num_shares: investment_params[:num_shares])
            new_shares = @investment.num_shares - investment_params[:num_shares].to_i
            @investment.update(num_shares: new_shares)
            new_balance = @portfolio.current_cash + (investment_params[:num_shares].to_f * current_price)
            @portfolio.update(current_cash: new_balance)
            redirect_to @portfolio
        elsif investment_params[:num_shares].to_i == @investment.num_shares
            record = Record.create(portfolio_id: @investment.portfolio_id, symbol: @investment.symbol, purchase_price: @investment.purchase_price, sell_price: current_price, sell_date: MyHelper.current_date_to_YYYYMMDD, num_shares: @investment.num_shares)
            @investment.destroy 
            new_balance = (@portfolio.current_cash + (investment_params[:num_shares].to_f * current_price))
            @portfolio.update(current_cash: new_balance)
            redirect_to @portfolio
        else 
            flash[:errors] = @investment.errors.full_messages
            redirect_to portfolio_sell_investment_path
        end
        
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
