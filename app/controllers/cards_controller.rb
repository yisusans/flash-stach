class CardsController < ApplicationController
	def show
	    @card = Card.find_by(id: params[:id])
		@round = Round.find_by(id: params[:captures][0])
  		render 'cards/show'
	end
end
