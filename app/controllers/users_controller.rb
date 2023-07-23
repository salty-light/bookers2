class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def index
  end

  def update
    @user = User.find(paramd[:id])
    unless user.id == cureent_user.id
        redirect_to edit_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @book= Book.new
    @books= @user.books

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
