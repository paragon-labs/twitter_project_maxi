require 'rails_helper'

RSpec.describe Admin::TweetsController, type: :controller do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:tweet) { create(:tweet) }

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

  describe 'PATCH #update' do

    context 'when user is admin' do
      it 'updates the tweet' do
        sign_in admin

        patch :update, id: tweet, tweet: { text: 'NewText' }

        expect(response).to redirect_to admin_tweets_path
      end
    end
    context 'when user is not an admin' do
      it 'redirects to home page' do
        sign_in user

        patch :update, id: tweet, tweet: { text: 'NewText' }

        expect(response).to redirect_to tweets_path
      end
    end

  end

  describe 'DELETE #destroy' do
    let!(:new_tweet) { create(:tweet) }

    context 'when user is admin' do
      it 'deletes the tweet' do
        sign_in admin

        expect{ delete :destroy, id: new_tweet }.to change{ Tweet.count }.by(-1)
      end
    end
    context 'when user is not an admin' do
      it 'does not delete the tweet' do
        sign_in user

        expect{ delete :destroy, id: new_tweet }.to_not change{ Tweet.count }
      end
    end

  end

end
