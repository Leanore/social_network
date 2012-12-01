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
    @posts = @user.posts
  end
  
  def edit
    @user = User.find params[:id]
    @information = @user.information
    @photo = @user.information.photo || Photo.new
  end
  
  def update
    @user = User.find params[:id]
    @user.information.photo = Photo.create params[:photo]
    @user.information.photo.save!
    respond_to do |format|
      if @user.information.update_attributes(params[:information])
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end


