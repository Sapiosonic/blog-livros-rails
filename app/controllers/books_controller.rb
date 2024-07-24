class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      turbo_stream.replace 'books', partial: 'books', locals: { books: Book.all }
    else
      turbo_stream.replace 'new_book', partial: 'form', locals: { book: @book }
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :rating, :description)
  end
end
