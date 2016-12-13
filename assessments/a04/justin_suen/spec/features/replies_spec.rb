require 'rails_helper'

feature "Adding replies" do
  before :each do
    sign_up_as_jack_bruce
  end

  it "has an add reply form on the tweet show page" do
    make_tweet
    expect(page).to have_content 'Reply Body'
    expect(page).to have_content 'Add Reply'
  end

  it "shows the tweet show page on submit" do
    make_tweet
    fill_in 'Reply Body', with: 'tweet reply!'
    click_button 'Add Reply'
    expect(current_path).to eq(tweet_path(Tweet.last))
  end

  it "validates that the reply isn't over 140 characters" do
    make_tweet
    fill_in 'Reply Body', with: ' ' * 141
    click_button 'Add Reply'
    expect(page).to have_content 'Body is too long'
  end

  it "adds the reply to the reply list on clicking the submit button" do
    make_tweet
    fill_in 'Reply Body', with: 'tweet reply!'
    click_button 'Add Reply'
    expect(page).to have_content 'tweet reply!'
  end
end

feature "Deleting replies" do
  before :each do
    sign_up_as_jack_bruce
    make_tweet
    add_reply
  end

  it "displays a remove button next to each reply" do
    expect(page).to have_button 'Remove Reply'
  end

  it "shows the tweet show page on click" do
    click_button 'Remove Reply'
    expect(page).to have_content 'jack_bruce'
    expect(page).to have_content 'My First Tweet'
  end

  it "removes the reply on click" do
    click_button 'Remove Reply'
    expect(page).to have_content 'My First Tweet'
    expect(page).to_not have_content 'tweet reply!'
  end
end
