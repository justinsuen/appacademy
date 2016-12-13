require 'rails_helper'

feature "Creating a tweet" do
  context "when logged in" do
    before :each do
      sign_up_as_jack_bruce
      visit new_tweet_path
    end

    it "takes a title and a body" do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Body'
    end

    it "validates that the tweet isn't over 140 characters" do
      visit new_tweet_path
      fill_in 'Title', with: "wat"
      fill_in 'Body', with: ' ' * 141
      click_button "Create New Tweet"
      expect(page).to have_content 'Body is too long'
    end

    it "redirects to the tweet show page" do
      make_tweet
      expect(page).to have_content 'My First Tweet'
    end

    context "on failed save" do
      before :each do
        make_tweet("", "La di da")
      end

      it "has a pre-filled form (with the data previously input)" do
        expect(find_field('Body').value).to eq('La di da')
      end

      it "still allows for a successful save" do
        fill_in 'Title', with: 'My First Tweet'
        click_button 'Create New Tweet'
        expect(page).to have_content 'My First Tweet'
      end
    end
  end

  context "when logged out" do
    it "redirects to the login page" do
      visit new_tweet_path
      expect(page).to have_content 'Sign In'
    end
  end
end

feature "Seeing all tweets" do
  context "when logged in" do
    before :each do
      sign_up_as_jack_bruce
      make_tweet('My First Tweet')
      make_tweet('My Second Tweet')
      visit tweets_path
    end

    it "shows all the tweets for the current user" do
      expect(page).to have_content 'My First Tweet'
      expect(page).to have_content 'My Second Tweet'
    end

    it "shows the current user's username" do
      expect(page).to have_content 'jack_bruce'
    end

    it "links to each of the tweets with the tweet titles" do
      click_link 'My First Tweet'
      expect(page).to have_content 'My First Tweet'
      expect(page).to_not have_content('My Second Tweet')
    end
  end

  context "when signed in as another user" do
    before :each do
      sign_up('jack_bruce')
      click_button 'Sign Out'
      sign_up('hi_world')
      make_tweet('Hi world')
      click_button 'Sign Out'
      sign_in('jack_bruce')
    end

    it "does not show others tweets" do
      visit tweets_path
      expect(page).not_to have_content('Hi world')
    end
  end
end

feature "Showing a tweet" do
  context "when logged in" do
    before :each do
      sign_up('jack_bruce')
      make_tweet('Hello, World!')
      visit tweets_path
      click_link 'Hello, World!'
    end

    it "displays the tweet title" do
      expect(page).to have_content 'Hello, World!'
    end

    it "displays the tweet body" do
      expect(page).to have_content 'The body of a tweet is rad.'
    end

    it "displays the author username" do
      # Once from the layout, once from the tweet itself

      expect(page).to have_content('jack_bruce', count: 2)
    end
  end
end

feature "Editing a tweet" do
  before :each do
    sign_up_as_jack_bruce
    make_tweet('This is a title')
    visit tweets_path
    click_link 'This is a title'
  end

  it "has a link on the show page to edit a tweet" do
    expect(page).to have_content 'Edit Tweet'
  end

  it "shows a form to edit the tweet" do
    click_link 'Edit Tweet'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Body'
  end

  it "has all the data pre-filled" do
    click_link 'Edit Tweet'
    expect(find_field('Title').value).to eq('This is a title')
    expect(find_field('Body').value).to eq('The body of a tweet is rad.')
  end

  context "on successful update" do
    let!(:show_page) { current_path }

    before :each do
      click_link 'Edit Tweet'
    end

    it "redirects to the tweet show page" do
      fill_in 'Title', with: 'A new title'
      click_button 'Update Tweet'
      expect(page).to have_content 'A new title'
      # Disallow creation of a new Tweet
      expect(current_path).to eq(show_page)
    end
  end

  context "on a failed update" do
    let!(:show_page) { current_path }

    before :each do
      click_link 'Edit Tweet'
    end

    it "returns to the edit page" do
      fill_in 'Title', with: ''
      click_button 'Update Tweet'

      # failed; should be able to try again
      fill_in 'Title', with: 'Ginger Baker'
      click_button 'Update Tweet'

      expect(current_path).to eq(show_page)
      expect(page).to have_content("Ginger Baker")
    end

    it "preserves the attempted updated data" do
      fill_in 'Title', with: ''
      click_button 'Update Tweet'

      expect(find_field('Title').value).to eq("")
    end
  end
end
