class PhotoAlbumsController < ApplicationController
  def index
    @photo_albums = PhotoAlbum.find_all_by_user_id(current_user.id)
  end

  def show
  end

  def edit
  end
end
