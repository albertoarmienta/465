class ReferencesController < ApplicationController
  before_action :get_reference, only: [:edit, :update, :destroy]
  
  def new 
    @topic = Topic.find(params[:topic_id])
    @reference = @topic.references.new
  end

  def edit
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @reference = @topic.references.new(reference_params)

    if @reference.save
      print "SAVED"
      redirect_to topic_url(@topic), notice: 'Reference Added'
    else
      redirect_to topic_url(@topic), notice: 'Reference Added'
      print "NOPE"
      #render :new
    end
  end

  def update
    if @reference.update(reference_params)
      redirect_to topic_url(@reference.topic), notice: 'Reference Updated'
    else
      render :edit
    end
  end

  def destroy
    @reference.destroy
    redirect_to topic_url(@reference.topic), notice: 'Reference Deleted'
  end

  private 
    def get_reference
      @reference = Reference.find(params[:id])
    end

    def reference_params
      params.require(:reference).permit(:url)
    end
end
