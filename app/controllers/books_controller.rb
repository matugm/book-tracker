class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:new, :edit]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create!(book_params)
    @book.tags << Tag.find(params[:tags])

    redirect_to :books
  end

  def destroy
    @book.destroy
    redirect_to :books
  end

  def update
    @book.update(book_params)
    @book.tags = Tag.where(id: params[:tags])

    redirect_to :books
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_tags
      @tags = Tag.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description)
    end
end
