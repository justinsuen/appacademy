class TweetsController < ApplicationController
  before_filter :require_user_login!

  def new
    @tweet = Tweet.new
    render :new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      render :show
    else
      flash[:errors] = @tweet.errors.full_messages
      render :new
    end
  end

  def edit
    @tweet = Tweet.find_by(params[:id])
    render :edit
  end

  def update
    @tweet = Tweet.find_by(params[:id])

    if @tweet.update_attributes(tweet_params)
      render :show
    else
      flash[:errors] = @tweet.errors.full_messages
      render :edit
    end
  end

  def show
    @tweet = Tweet.find(params[:id])

    if @tweet
      render :show
    else
      flash[:errors] = ["No such tweet"]
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end
end
