class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
   #@user = User.find(params[:id)
    #@book= Book.new
    @users= User.all

  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)

    redirect_to user_path
  else
    render :edit
  end
  end


  def show
    @user = current_user
    @book= Book.new
    @books= @user.books

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

    def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
    end

end
