require 'rails_helper'

describe 'Edit Favorites' do

  let(:admin) { create(:admin) }
  let!(:tweet) { create(:tweet) }
  let!(:favorite) { create(:favorite) }

  before do
    login_as admin
  end

  it 'edits a favorite' do
    visit edit_admin_favorite_path(favorite)

    select(admin.email, from: 'favorite_user_id')
    select(tweet.id, from: 'favorite_tweet_id')
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'Favorite updated successfully.')
  end

end
