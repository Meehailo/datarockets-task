class PostsController < ApplicationController
  # skip_before_action :verify_authenticity_token if Rails.env.test?
  after_action :save_history, only: %i[ create ], if: Proc.new { |controller| controller.response.status < 400 }

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Post.delete(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:author, :title, :body).merge({ user_id: current_user&.id })
  end

  def save_history
    SaveHistoryService.new(params[:action], current_user).call
  end
end
