class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    super
    @user.build_information
    #@user.information.some_data = 'abcd'
    @user.save!
  end


  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @user = User.find(params[:id])
  end
end


