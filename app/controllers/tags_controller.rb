class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  def show
    @books = Tag.find_books_by_tag(params[:tag_name])
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
