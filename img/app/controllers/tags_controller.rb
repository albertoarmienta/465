class TagsController < ApplicationController

  def destroy
    Tag.find(params[:id]).delete
    redirect_to :back, notice: 'Tag Deleted'
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
