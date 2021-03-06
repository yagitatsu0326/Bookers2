class BookcommentsController < ApplicationController

  before_action :authenticate_user!

  def create
  	book = Book.find(params[:book_id])
  	bookcomment = Bookcomment.new(book_comment_params)
  	bookcomment.user_id = current_user.id
  	bookcomment.book_id = book.id
  	if bookcomment.save
  	   redirect_to request.referer
    else
       redirect_to request.referer
    end
  end

  def destroy
  	Bookcomment.find_by(id: params[:id], book_id: params[:book_id]).destroy
  	redirect_to request.referer
  end

  private
    def book_comment_params
  	 params.require(:bookcomment).permit(:comment)
    end


end
