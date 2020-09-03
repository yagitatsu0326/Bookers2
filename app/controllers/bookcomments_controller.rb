class BookcommentsController < ApplicationController
  def create
  	book = Book.find(params[:book_id])
  	bookcomment = Bookcomment.new(book_comment_params)
  	bookcomment.user_id = current_user.id
  	bookcomment.book_id = book.id
  	bookcomment.save
  	redirect_to request.referer
  end

  def destroy
  	Bookcomment.find_by(id: params[:id], book_id: params[:book_id]).destroy
  	redirect_to request.referer
  end

  def book_comment_params
  	params.require(:bookcomment).permit(:comment)
  end
end
