class NewsController < ApplicationController

    def show
        @news = News.find(params[:id])
        news_hash = MyHelper.get_news(@news[:search_term])
        @top_5_hash = news_hash["articles"][0..4]
        @stock_data = MyHelper.get_current_stock_data(@news[:search_term])
    end

    def create
        @news = News.create(search_term: params[:search_term])
        redirect_to @news
    end


    private
    # def news_params
    #     params.require(:news).permit(:search_term)
    # end


end
