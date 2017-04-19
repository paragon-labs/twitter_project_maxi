require 'rails_helper'

describe 'Remove Favorite', :vcr do

  let(:user) { create(:user_with_tweets) }

  before do
    login_as user
  end

  it 'removes a tweet from favorites' do
    visit favorites_path

    all('div .top-right').first.find('button').click

    expect(page).to have_css('.alert-info', text: 'Tweet removed from favorites.')
  end

end
