class BooksController < ApplicationController
  before_action :hoge, only: [:show, :edit, :update, :destroy]

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
       redirect_to @book, notice: 'Book was successfully created.'
    else
      render :index
    end
  end

  def update
     if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
     else
      render :edit
     end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
   
    def hoge
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
