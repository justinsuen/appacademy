class PostsController < ApplicationController
  before_action :require_author_edit, only: [:edit, :update]
  before_action :require_delete, only: [:destroy]

  def new
    @post = Post.new
    @sub_id = params[:sub_id]
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
    if @post.save
      flash[:notice] = "Successfully created a post!"
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])

    if @post
      render :show
    else
      redirect_to root_url
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_post_url(@post.sub_id, @post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post
      flash[:notice] = "Post deleted"
      @post.destroy
    else
      flash[:notice] = "Post does not exist"
    end

    redirect_to sub_url(@post.sub_id)
  end

  private

  def require_author_edit
    @post = Post.find_by(id: params[:id])
    unless current_user.id == @post.author_id
      flash.now[:errors] = "You must be the author to edit"
      render :show
    end
  end

  def require_delete
    @post = Post.find_by(id: params[:id])
    @sub = Sub.find_by(id: @post.sub_id)
    unless current_user.id == @sub.moderator_id ||
      current_user.id == @post.author_id
      flash.now[:errors] = "You must be the author or moderator to delete"
      render :show
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end
end
