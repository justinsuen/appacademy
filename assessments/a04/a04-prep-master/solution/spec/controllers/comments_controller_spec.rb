require 'rails_helper'

# So specs will run and not throw scary errors before LinksController is implemented
begin
  CommentsController
rescue
  CommentsController = nil
end

RSpec.describe CommentsController, :type => :controller do
  let(:jack_bruce) { User.create!(username: "jack_bruce", password: "abcdef") }

  let(:link) do
    Link.create!(user: jack_bruce, title: "neopets", url: "neopets.com")
  end

  let(:comment) do
    Comment.create!(body: "omg neopets", user_id: jack_bruce.id, link_id: link.id)
  end

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "POST #create" do
    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        post :create, comment: { body: "cool", link_id: link.id }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { jack_bruce }
      end

      context "with invalid params" do
        it "flashes errors" do
          post :create, comment: { link_id: link.id }
          expect(flash[:errors]).to be_present
        end
      end

      context "with valid params" do
        it "redirects to the link show page" do
          post :create, comment: { link_id: link.id, body: "a comment" }
          expect(response).to redirect_to(link_url(link))
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "when logged out" do

      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        delete :destroy, id: comment.id
        expect(response).to redirect_to(new_session_url)
      end
    end

    context "when logged in" do
      before do
        allow(controller).to receive(:current_user) { jack_bruce }
      end

      it "removes the comment and redirects back to the link" do
        delete :destroy, id: comment.id
        expect(response).to redirect_to(link_url(link))
        expect(Comment.exists?(comment.id)).to be false
      end
    end
  end
end
