require 'rails_helper'

describe 'Edit Tweets' do

  let(:tweet) { create(:tweet) }
  let(:admin) { create(:admin) }

  before do
    login_as admin
  end

  it 'edits a tweet' do
    visit edit_admin_tweet_path(tweet)

    fill_in 'tweet_text', with: tweet.text
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'Tweet updated successfully.')
  end

end
