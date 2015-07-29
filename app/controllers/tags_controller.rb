class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  def show
    @books = Tag.find_by(name: params[:tag_name]).books
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end
end
