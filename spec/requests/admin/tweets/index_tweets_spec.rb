require 'rails_helper'

describe 'List Tweets' do

  let!(:user) { create(:user_with_tweets) }
  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit admin_tweets_path
  end

  it 'lists all tweets' do
    expect(page).to have_content('System Tweets')
  end

  it 'has both tweets' do
    expect(page).to have_selector('table td', minimum: 2)
  end

end
