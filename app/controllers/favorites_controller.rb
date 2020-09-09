class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
  	@book = Book.find(params[:book_id])
    Favorite.create(user_id: current_user.id, book_id: @book.id).save
  end

  def destroy
  	@book = Book.find(params[:book_id])
  	Favorite.find_by(user_id: current_user.id, book_id: @book.id).destroy
  end
end
