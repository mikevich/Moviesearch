class SearchesController < ApplicationController
    def new
        @search = Search.new
    end

    def create
        @search = Search.create!(search_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
    end

private

    def search_params
        params.require(:search).permit(:keywords, 
        :genre_id, 
        :studio_id, 
        :min_audience_score, 
        :max_audience_score, 
        :min_rt_score, 
        :max_rt_score, 
        :min_profitability, 
        :max_profitability,
        :min_gross,
        :max_gross,
        :min_year,
        :max_year)
    end
end
