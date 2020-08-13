class BooksController < ApplicationController
	
	def new
		@book =Book.new
	end
	def create
		@book =Book.new
		
	end
	def show
	end
	def edit
	end
	def index
	end
	
	private
	def books_params
	end
end
