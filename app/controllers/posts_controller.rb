class PostsController < ApplicationController

  def index
    posts = Post.all

    render json: posts
  end 

  # def create
  #   posts = Post.create(post_params)

  #   if posts.valid?
  #     render json: posts, status: :created
  #   else
  #     render json: { errors: posts.errors }, status: :unprocessable_entity 
  #   end 
    
  # end


  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post
    rescue ActiveRecord::RecordInvalid => invalid
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

end
