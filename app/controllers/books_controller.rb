class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_params)
        redirect_to @book
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        @book.authors << Author.find(params[:book][:authors])
        redirect_to @book
    end

    def destroy
        
        @book = Book.find(params[:id])
        @author = Author.find(params["author"].keys[0])
        @book_author = BookAuthor.find_by(author_id: @author, book_id: @book)
        @book_author.destroy
        redirect_to @book
    end

    private

    def book_params
        params.require(:book).permit(:title, :pages, :authors)
    end

    
end