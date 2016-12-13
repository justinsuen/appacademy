require 'rails_helper'

feature "Sign up" do
  before :each do
    visit new_user_path
  end

  it "has a user sign up page" do
    expect(page).to have_content "Sign Up"
  end

  it "takes a username and password" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  it "logs the user in and redirects them to tweets index on success" do
    sign_up_as_jack_bruce
    # add user name to application.html.erb layout
    expect(page).to have_content 'jack_bruce'
    expect(current_path).to eq(tweets_path)
  end
end

feature "Sign out" do
  it "has a sign out button" do
    sign_up_as_jack_bruce
    expect(page).to have_button 'Sign Out'
  end

  it "logs a user out on click" do
    sign_up_as_jack_bruce

    click_button 'Sign Out'

    # redirect to login page
    expect(current_path).to eq(new_session_path)
  end
end

feature "Sign in" do
  it "has a sign in page" do
    visit new_session_url
    expect(page).to have_content "Sign In"
  end

  it "takes a username and password" do
    visit new_session_url
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  it "takes a user to tweets index on success" do
    User.create!(username: 'jack_bruce', password: 'abcdef')

    sign_in_as_jack_bruce

    expect(page).to have_content 'jack_bruce'
    expect(current_path).to eq(tweets_path)
  end
end
