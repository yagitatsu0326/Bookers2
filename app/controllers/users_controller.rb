class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = @user.books.reverse_order
  	@book =Book.new
  end
  def index
  	@books = Book.all
  end

  
end
