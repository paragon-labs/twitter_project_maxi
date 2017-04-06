require 'rails_helper'

describe 'Home page' do

  let(:user) { create :user }

  before do
    login_as user
  end

  context 'List Tweets' do
    it 'shows all tweets' do
      visit tweets_path

      expect(page).to have_css('blockquote', class: 'twitter-tweet', count:10)
    end
  end

  context 'Navigation bar' do
    it 'renders My Profile Page' do
      visit tweets_path

      click_link 'My Profile'

      expect(page).to have_content('Edit Profile')
    end
  end

end
