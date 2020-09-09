class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit]
	def new
		@book =Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:create] = "You have creatad book successfully."
		   redirect_to book_path(@book.id)
		else
			@user = current_user
        	#@book = Book.new →消すことでエラー表示
        	@books = Book.all
			render 'index'
		end
	end
	def show
		@book = Book.find(params[:id])
		@books = Book.all
		@user = @book.user
		@book_new = Book.new
		@bookcomment = Bookcomment.new
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
		@book = Book.new
		@user = current_user
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
	def correct_user
      @book = Book.find(params[:id])
      if current_user != @book.user
         redirect_to books_path
      end
  	end

end
