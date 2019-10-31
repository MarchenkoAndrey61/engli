class UsersController < ApplicationController
  
  def index
    @users = User.order(carma: :desc).paginate(:page => params[:page])
  end


  def show
    @user = User.friendly.find(params[:id])
    @phrases = @user.phrases
  end
end

