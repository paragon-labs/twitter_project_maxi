require 'rails_helper'

describe 'List Favorites', :vcr do

  let(:user) { create(:user_with_tweets) }

  before do
    login_as user
  end

  it 'lists all my favorites' do
    visit favorites_path

    expect(page).to have_css('blockquote', class: 'twitter-tweet', count: 2)
  end

end
