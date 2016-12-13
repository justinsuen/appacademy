class RepliesController < ApplicationController
  def new
    render :new
  end

  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      redirect_to tweet_url(@reply.tweet_id)
    else
      flash[:errors] = @reply.errors.full_messages
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :tweet, :tweet_id)
  end
end
