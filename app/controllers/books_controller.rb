class BooksController < ApplicationController

	def new
		@book =Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		   redirect_to book_path(@book.id)
		else
			@books = Book.all
			@user = current_user
        	@book = Book.new
			render "books/index"
		end
	end
	def show
		@books = Book.where(id: params[:id])
        @user = current_user
        @book = Book.new

	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		   flash[:update] = "You have updated user successfully."
  	       redirect_to book_path
  	   else
  	   	   render :edit
  	   end
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	def index
		@books = Book.all
		@user = current_user
        @book = Book.new
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
