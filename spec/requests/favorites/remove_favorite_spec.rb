require 'rails_helper'

describe 'Remove Favorite', :vcr do

  let!(:user) { create(:user_with_tweets) }

  before do
    login_as user
  end

  it 'removes a tweet from favorites', js: true do
    visit favorites_path

    find('div .top-right', match: :first).find('button').click

    expect(page).to have_css('blockquote', class: 'twitter-tweet', count: 1)
  end

end
