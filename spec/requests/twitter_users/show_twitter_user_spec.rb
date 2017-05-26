require 'rails_helper'

describe 'Show Twitter User', :vcr do

  let(:user) { create :user }

  before do
    login_as user
  end

  context 'show twitter user profile' do
    it 'renders the show page' do
      visit tweets_path

      first(:link, class: 'popoverData').click

      expect(page).to have_css('h1', class: 'profile-name')
    end
  end

end
