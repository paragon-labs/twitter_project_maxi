require 'rails_helper'

RSpec.describe Admin::TweetsController, type: :controller do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe 'GET #index' do

    context 'when user is admin' do
      it 'has a 200 status code' do
        sign_in admin

        get :index

        expect(response).to have_http_status(200)
      end
    end
    context 'when user is not an admin' do
      it 'redirects to tweets home page' do
        sign_in user

        get :index

        expect(response).to redirect_to(tweets_path)
      end
    end

  end

  describe 'POST #create' do

    let(:tweet) { build(:tweet) }

    context 'when user is admin' do
      it 'creates a new tweet' do
        sign_in admin

        post :create, tweet: { number: tweet.number, text: 'SomeText' }

        expect(response).to redirect_to admin_tweets_path
      end
    end
    context 'when user is not an admin' do
      it 'redirects to the home page' do
        sign_in user

        post :create, tweet: { number: tweet.number, text: 'SomeText' }

        expect(response).to redirect_to tweets_path
      end
    end

  end

end
