require 'rails_helper'

# So specs will run and not throw scary errors before UsersController is implemented
begin
  UsersController
rescue
  UsersController = nil
end

RSpec.describe UsersController, :type => :controller do

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {username: "jack_bruce", password: ""}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: {username: "jack_bruce", password: "short"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to posts index on success" do
        post :create, user: {username: "jack_bruce", password: "password"}
        expect(response).to redirect_to(tweets_url)
      end
    end
  end
end
