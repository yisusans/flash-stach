class DeckController < ApplicationController

	def index
		@decks = Deck.all
		render 'index'
	end

end
