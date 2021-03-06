class GuessesController < ApplicationController

	def create
		submitted_answer = Card.find_by(id: params[:card_id])
		if submitted_answer.answer.downcase == params[:'/guesses'][:response].downcase
		    correct = true
		else
		    correct = false
		end

		if logged_in?
		    @guess = Guess.create(user_id: current_user.id, round_id: params[:round_id], card_id: params[:card_id], response: params[:response], is_correct: correct)
	    else
		    @guess = Guess.create(round_id: params[:round_id], card_id: params[:card_id], response: params[:response], is_correct: correct)
		end

		@round = Round.find_by(id: params[:round_id])
		@card = @round.next_card

	    if @card
		    render "cards/show"
	    else
		    redirect_to "/rounds/#{@round.id}"
	    end
	end

end
