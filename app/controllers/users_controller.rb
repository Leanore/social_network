class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    if params[:id].nil?
      @user = current_user
    else 
      @user = User.find params[:id]
    end
  end
  
  def edit
    @user = User.find params[:id]
    @information = @user.information
  end
end


