class UsersController < ApplicationController
  def new
  	@user = User.new
  	@book = Book.new
  end
  def create
  	@book = Book.new(book_params)
  	if @book.save
  	   flash[:create] = "You have creatad book successfully."
  	   redirect_to book_path
  	else
  		render "books/index"
  	end
  end
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.all
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
  	   flash[:update] = "You have updated user successfully."
  	   redirect_to user_path(@user.id)
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:profile_image, :name, :introduction)
  end
  def book_params
	params.require(:book).permit(:title, :body)
  end
end
