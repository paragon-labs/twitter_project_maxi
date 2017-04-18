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

  it 'has the edit button' do
    tweet_id = user.faved_tweets.first.id

    expect(page).to have_link(href: edit_admin_tweet_path(tweet_id))
  end

  it 'has the delete button' do
    tweet_id = user.faved_tweets.first.id

    expect(page).to have_link(href: admin_tweet_path(tweet_id))
  end

end
