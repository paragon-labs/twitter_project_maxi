require 'rails_helper'

describe 'List Favorites' do

  let!(:users) { create_list(:user_with_tweets, 10) }
  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit admin_favorites_path
  end

  it 'lists all favorites' do
    expect(page).to have_content('System Favorites')
  end

  it 'shows the favorites table' do
    expect(page).to have_selector('table tr', count: 10)
  end

end
