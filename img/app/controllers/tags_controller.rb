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
  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to @tag.image, notice: 'Tag successfully updated'
    else
      render :edit
    end

  end

  private 

  def tag_params
    params.require(:tag).permit(:tag)
  end
end
