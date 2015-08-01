class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
