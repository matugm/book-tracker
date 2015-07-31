class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @tags  = Tag.all
  end

  def new
    @book = Book.new
    @tags = Tag.all
  end

  def create
    Book.create(book_params)
    redirect_to :books
  end

  def destroy
    @book.destroy
    redirect_to :books
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description).permit(:tags)
    end
end
