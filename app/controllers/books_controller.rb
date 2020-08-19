class BooksController < ApplicationController
	
	def new
		@book =Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.user = current_user
		@book.save
		redirect_to book_path(@book.id)
	end
	def show
		@book = Book.where(id: params[:id])
        @user = current_user.id
	end
	def edit
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	def index
		@books = Book.all
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
