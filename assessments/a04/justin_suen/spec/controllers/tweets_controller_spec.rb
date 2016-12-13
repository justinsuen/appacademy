require 'rails_helper'

# So specs will run and not throw scary errors before TweetsController is implemented
begin
  TweetsController
rescue
  TweetsController = nil
end

RSpec.describe TweetsController, :type => :controller do
  let(:jack) { User.create!(username: 'jack_bruce', password: 'abcdef') }

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "GET #new" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "renders the new tweets page" do
        get :new, post: {}
        expect(response).to render_template("new")
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :new, post: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET #index" do
    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :index, post: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end


  describe "PATCH #update" do
    context "when logged in as a different user" do
      create_jill_with_tweet

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "should not allow users to update another users tweets" do
        begin
          patch :update, id: jill_tweet, tweet: {title: "Jack Hax"}
        rescue ActiveRecord::RecordNotFound
        end

        edited_tweet = Tweet.find(jill_tweet.id)
        expect(jill_tweet.title).to eq("Jill Post")
      end
    end
  end

  describe "POST #create" do

    before do
      allow(controller).to receive(:current_user) { jack }
    end

    context "with invalid params" do
      it "validates the presence of title and body" do
        post :create, tweet: {body: "this is an invalid post"}
        expect(response).to render_template("new")
      end
    end

    context "with valid params" do
      it "redirects to the tweet show page" do
        post :create, tweet: {title: "teehee", body: "haha this tweet is funny"}
        expect(response).to redirect_to(tweet_url(Tweet.last))
      end
    end
  end
end
