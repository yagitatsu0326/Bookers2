class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
  	@book = Book.find(params[:id])
  	@user = User.find(params[:id])
  end
  def index
  	@books = Book.all
  	@users = User.all
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:profile_image, :name, :introduction)
  end

end
