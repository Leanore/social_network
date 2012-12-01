class PhotoAlbumsController < ApplicationController
  before_filter :authenticate_user!, :load_user
  
  def index
    #@photo_albums = PhotoAlbum.find_all_by_user_id(current_user.id)
    @photo_albums = @user.photo_albums.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photo_albums }
    end
  end

  def show
    #@photo_album = PhotoAlbum.find(params[:id])
    @photo_album = @user.photo_albums.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo_album }
    end
  end

  def edit
    #@photo_album = PhotoAlbum.find(params[:id])
    @photo_album = @user.photo_albums.find(params[:id])
  end
  
  def new
    #@photo_album = PhotoAlbum.new
    @photo_album = @user.photo_albums.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo_album }
    end
  end
  
  def create
    #@photo_album = PhotoAlbum.new(params[:photo_album])
    @photo_album = @user.photo_albums.new(params[:photo_album])

    respond_to do |format|
      if @photo_album.save
        format.html { redirect_to user_photo_albums_path(@user.id), notice: 'Photo album was successfully created.' }
        format.json { render json: @photo_album, status: :created, location: @photo_album }
      else
        format.html { render action: "new" }
        format.json { render json: @photo_album.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    #@photo_album = PhotoAlbum.find(params[:id])
    @photo_album = @user.photo_albums.find(params[:id])

    respond_to do |format|
      if @photo_album.update_attributes(params[:photo_album])
        format.html { redirect_to [@user, @photo_album], notice: 'Photo album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo_album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@photo_album = PhotoAlbum.find(params[:id])
    @photo_album = @user.photo_albums.find(params[:id])
    @photo_album.destroy

    respond_to do |format|
      format.html { redirect_to photo_albums_url }
      format.json { head :no_content }
    end
  end
  
  def load_user
    @user = User.find(params[:user_id])
  end
end
