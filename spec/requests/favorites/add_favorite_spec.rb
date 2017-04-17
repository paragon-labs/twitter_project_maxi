require 'rails_helper'

describe 'Add Favorite', :vcr do

  let(:user) { create(:user) }

  before do
    login_as user
  end

  it 'adds a tweet as favorite' do
    visit tweets_path

    all('div .top-right').first.find('button').click

    expect(page).to have_css('.alert-info', text: 'Tweet added to favorites.')
  end

end
