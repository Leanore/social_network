class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    @user.build_information
    #@user.information.some_data = 'abcd'
    @user.save!
    @user.photo_albums.create(:title => "Main album")
    puts "FROM REG!!!!!"
  end

  def update
    super
  end
end 