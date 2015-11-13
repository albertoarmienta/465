class ImageUsersController < ApplicationController
  def create
    @image   = Image.find(params[:image_id])
    @newUser = @image.image_users.new(image_user_params)
    @newUser.image_id = @image.id
    if @newUser.save
      redirect_to image_url(@image), notice: 'User granted Access'
    else
      redirect_to image_url(@image), notice: 'User granted Access'
    end
  end

  def destroy
    ImageUser.find(params[:id]).destroy
  end

  private 

  def image_user_params
    params.require(:image_user).permit(:user_id)
  end
end
