class StocksController < ApplicationController

    def search

        if params[:stock]
            @stock = Stock.find_by_ticker(params[:stock])
            @stock = Stock.new_from_lookup(params[:stock])
        end

        if @stock
            #render json: @stock
            render partial: 'lookup'
        else
            head :not_found
        end
        
    end

end