class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def show
  	@user = User.find_by(id: params[:id])
  	@email = @user.email
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in(@user)
  		redirect_to @user
  	else
  		@errors = @user.errors.full_messages
  		render 'new'
  	end
  end

private
	
	def user_params
		params.require(:user).permit(:email, :password)
	end
end

