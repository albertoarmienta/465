class TopicsController < ApplicationController
  before_action :get_topic, only: [:show, :edit, :update, :destroy]
  # GET /professors
  def index
    @topics = Topic.all
  end

  # GET /topics/:id
  def show
    @reference = @topic.references.new
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/:id/edit
  def edit
  end

  # POST /topics
  def create 
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic, notice: 'Topic successfully inserted'
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Update was Successful'
    else
      render :edit
    end
  end
  def destroy
    @topic.destroy
    redirect_to topics_url
  end

  private
    def get_topic
      @topic = Topic.find(params[:id])
    end

    # this function only perimits the specified fields, so
    # noone trys to inject malicous http requests
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
