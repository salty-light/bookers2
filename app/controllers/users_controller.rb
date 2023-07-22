class UsersController < ApplicationController


  def index
  end

  def show
    @user = UserImage.find(params[:id])
    @use_images = @user.user_images
  end
end


