require 'rails_helper'

describe 'Home page' do

  let(:user) { create :user }

  before do
    login_as user
  end

  context 'List Tweets' do
    it 'shows all tweets' do
      visit home_index_path

      expect(page).to have_content('Trending Tweets in Uruguay:')
    end
  end

  context 'Navigation bar' do
    it 'renders My Profile Page' do
      visit home_index_path

      click_link 'My Profile'

      expect(page).to have_content('Edit Profile')
    end
  end

end
