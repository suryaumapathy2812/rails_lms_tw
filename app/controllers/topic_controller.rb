class TopicController < ApplicationController
  before_action :get_course
  before_action :get_topics
  before_action :set_topic, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
  end

  def edit; end

  def create
    @topic = Topic.new(topic_params)
    @topic.course_id = @course.id
    @topic.user_id = current_user.id
    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_url(@course, @topic), notice: "Topic was successfully created." }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.error, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to topic_url(@topic), notice: "Topic was successfully updated." }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Topic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_course
    @course = Course.find(params[:course_id])
  end

  def get_topics
    @topics = @course.topics
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :summary, :description, :course_id, :user_id)
  end

end
