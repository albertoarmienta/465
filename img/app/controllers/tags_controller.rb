class TagsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)
    if @tag.save
      redirect_to image_url(@image), notice: 'Reference Added'
    else
      redirect_to image_url(@image), notice: 'Reference NOT Added'
    end
  end

  private 

  def tag_params
    params.require(:tag).permit(:tag)
  end
end
