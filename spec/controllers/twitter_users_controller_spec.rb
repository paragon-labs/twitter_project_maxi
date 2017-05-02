require 'rails_helper'

RSpec.describe TwitterUsersController, type: :controller do


  let(:user) { create :user }
  let(:tweet) { TwitterClient.new.search('463440424141459456').first }

  describe 'GET #show', :vcr do

    context 'when user logged in' do
      it 'shows the twitter_user profile' do
        sign_in user

        get :show, id: tweet.user.screen_name

        expect(response.status).to eq 200
      end
    end

  end
end
