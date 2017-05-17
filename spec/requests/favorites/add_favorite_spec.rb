require 'rails_helper'

describe 'Add Favorite', :vcr do

  let(:user) { create(:user) }

  before do
    login_as user
  end

  it 'adds a tweet as favorite', js: true do
    visit tweets_path

    find('div .top-right', match: :first).find('button').click

    expect(page).to have_selector(:link_or_button, 'Unfavorite')
  end

end
