require 'rails_helper'

describe "List Tweets" do

  let(:user) { create :user }

  it "shows all tweets" do
    login_as user

    visit home_index_path

    expect(page).to have_content('Trending Tweets in Uruguay:')
  end

end
