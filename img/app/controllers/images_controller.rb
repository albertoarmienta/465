class ImagesController < ApplicationController
  def index
    @hasUser = user_signed_in?
    @images = Image.all
  end

  def show
    @thisImage      = Image.find(params[:id])
    @imageOwner     = User.find(@thisImage.user_id)
    @hasPermission  = false
    @isOwner        = false 
    if user_signed_in?
      if @thisImage.user_id == current_user.id
        @hasPermission = true
        @isOwner = true
      else
        @thisImage.users.each do |usr|
          if usr.id == current_user.id
            @hasPermission = true
            break
          end
        end
      end
    end

    if @isOwner
      @tag     = @thisImage.tags.new
      @newUser = @thisImage.image_users.new
      @availableUsers = User.all

      @formatedSelectorContents = Hash.new
      @availableUsers.each do |usr|
        matchfound = false
        @thisImage.users.each do |iusr|
          if usr.id == iusr.id
            matchfound = true
          end
        end
        if !matchfound
          @formatedSelectorContents.store("#{usr.name} (#{usr.email}) ", usr.id)
        end
      end
    end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.filename = @image.generateFilename
    @image.user_id = current_user.id
    @uploaded_io = params[:image][:uploaded_file]
    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
      file.write(@uploaded_io.read)
    end
    if @image.save
      redirect_to @image, notice: 'Image was Successfully created.'
    else
      render :new
    end
  end
  def update
    @thisImage = Image.find(params[:id])
    if @thisImage.update(image_params)
      redirect_to @thisImage, notice: 'Privacy updated'
    else
      redirect_to @thisImage, notice: 'Privacy NOT updated'
    end
  end

  def toggle_private
    @thisImage = Image.find(params[:id])
    if @thisImage.isPrivate
      @thisImage.isPrivate = false
    else 
      @thisImage.isPrivate = true 
    end
    @thisImage.save

    render :show
  end

  private 

  def image_params
    params.require(:image).permit(:isPrivate)#, :uploaded_file)
  end
end
