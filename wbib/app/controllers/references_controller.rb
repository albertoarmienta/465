class ReferencesController < ApplicationController
  def index
  end
  
  def new 
    @reference = Reference.new
  end

  private 
    def get_reference
      @topic = Topic.find(params[:topic_id])
      @reference = @topic.references.new
    end

    def reference_params
      params.require(:reference).permit(:url)
end
