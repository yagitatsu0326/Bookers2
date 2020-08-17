class UsersController < ApplicationController
  def new
  	@user = User.new
  	@book = Book.new
  end
  def create
  	@book = Book.new(book_params)
  	@book.save
  	redirect_to book_path
  end
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end
  def index
  	@users = User.all
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "You have updated user successfully."
  	   redirect_to user_path(@user.id)
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
