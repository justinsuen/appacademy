require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create!(username: "kobe_bryant", password: "black_mamba") }

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new, link: {}
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "with invalid id - renders index template" do
      get :show, id: 10000
      expect(response).to render_template(:index)
      expect(flash[:errors]).to be_present
    end

    it "with valid id - renders show template" do
      get :show, id: user.id
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    it "with invalid params - no password" do
      post :create, user: { username: "lebron_james", password: "" }
      expect(response).to render_template(:new)
      expect(flash[:errors]).to be_present
    end

    it "with invalid params - short password < 6 characters" do
      post :create, user: { username: "lebron_james", password: "king" }
      expect(response).to render_template(:new)
      expect(flash[:errors]).to be_present
    end

    it "with valid params - redirect to user page on success" do
      post :create, user: { username: "lebron_james", password: "theking" }
      expect(response).to render_template(:show)

    end
  end
end
