require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up"
  end

  feature "signing up a user" do
    scenario "shows username on the homepage after signup" do
      sign_up_as('flockaveli')
      expect(page).to have_content "flockaveli"
    end
  end
end

feature "logging in" do
  let(:user) { User.create!(username: "flockaveli", password: "password") }

  scenario "shows username on the homepage after login" do
    login_as(user)
    expect(page).to have_content "flockaveli"
  end
end

feature "logging out" do
  let(:user) { User.create!(username: "flockaveli", password: "password") }

  scenario "begins with a logged out state" do
    visit root_url
    expect(page).to have_content "Log in"
  end

  scenario "doesn't show username on the homepage after logout" do
    login_as(user)
    click_link "Log out"
    expect(page).not_to have_content "flockaveli"
  end
end
