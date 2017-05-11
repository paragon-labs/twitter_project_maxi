require 'rails_helper'

describe 'List Favorites' do

  let!(:user) { create(:user_with_tweets) }
  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit admin_favorites_path
  end

  it 'lists all favorites' do
    expect(page).to have_content('System Favorites')
  end

  it 'shows the favorites table' do
    expect(page).to have_selector('table tr', minimum: 2)
  end

end
