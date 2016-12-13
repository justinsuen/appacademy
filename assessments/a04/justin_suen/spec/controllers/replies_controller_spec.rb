require 'rails_helper'

# So specs will run and not throw scary errors before RepliesController is implemented
begin
  RepliesController
rescue
  RepliesController = nil
end

RSpec.describe RepliesController, :type => :controller do

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "POST #create" do
    let(:jack_bruce) { User.create!(username: "jack_bruce", password: "abcdef") }
    let(:jack_tweet) { Tweet.create!(title: "neopets", body: "gotta love em", user: jack_bruce)}

    before do
      allow(controller).to receive(:current_user) { jack_bruce }
    end

    context "with invalid params" do
      it "flashes errors" do
        post :create, reply: {tweet_id: jack_tweet.id}
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the tweet show page" do
        post :create, reply: {tweet_id: jack_tweet.id, body: "neopets"}
        expect(response).to redirect_to(tweet_url(jack_tweet))
      end
    end
  end
end
