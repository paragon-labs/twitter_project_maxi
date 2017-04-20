require 'rails_helper'

describe 'Create Favorites' do

  let(:admin) { create(:admin) }
  let!(:tweet) { create(:tweet) }

  before do
    login_as admin
  end

  it 'creates a new favorite' do
    visit admin_favorites_path

    click_link 'New Favorite'
    select(admin.email, from: 'favorite_user_id')
    select(tweet.id, from: 'favorite_tweet_id')
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'Favorite added successfully.')
  end

end
