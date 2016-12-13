class RepliesController < ApplicationController
  def new
    render :new
  end

  def create
    reply = Reply.new(reply_params)
    reply.user_id = current_user.id
    reply.save
    flash[:errors] = reply.errors.full_messages
    redirect_to tweet_url(reply.tweet)
  end

  def destroy
    reply = Reply.find(params[:id])
    reply.destroy
    redirect_to tweet_url(reply.tweet_id)
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :tweet_id)
  end
end
