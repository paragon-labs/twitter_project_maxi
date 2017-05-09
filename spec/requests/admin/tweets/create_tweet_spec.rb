require 'rails_helper'

describe 'Create Tweets' do

  let(:admin) { create(:admin) }
  let(:tweet) { build(:tweet) }

  before do
    login_as admin
  end

  it 'creates a new tweet' do
    visit admin_tweets_path

    click_link 'New Tweet'
    fill_in 'Number', with: tweet.number
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'Tweet created successfully.')
  end

end
