class SearchsController < ApplicationController

  before_action :authenticate_user!

  def search
  	@user_or_book = params[:model]
  	@how_search = params[:choice]
  	@search = params[:search]
  	if @user_or_book == "1"
  		@users = User.search(params[:search], @user_or_book, @how_search)
  	elsif @user_or_book == "2"
  		@books = Book.search(params[:search], @user_or_book, @how_search)
  	else
  		all
  	end
  end
end
