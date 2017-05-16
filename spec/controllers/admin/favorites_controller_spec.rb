require 'rails_helper'

RSpec.describe Admin::FavoritesController, type: :controller do

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
      it 'creates a new favorite' do
        sign_in admin

        post :create, favorite: { user_id: admin.id, tweet_id: tweet.id }

        expect(response).to redirect_to admin_favorites_path
      end
    end
    context 'when user is not admin' do
      it 'redirects to the home page' do
        sign_in user

        post :create, favorite: { user_id: user.id, tweet_id: tweet.id }

        expect(response).to redirect_to tweets_path
      end
    end

  end

  describe 'PATCH #update' do
    let(:favorite) { create :favorite }

    context 'when user is admin' do
      it 'updates the favorite' do
        sign_in admin

        patch :update, id: favorite, favorite: { user_id: admin.id, tweet_id: favorite.tweet_id }

        expect(response).to redirect_to admin_favorites_path
      end
    end
    context 'when user is not an admin' do
      it 'redirects to home page' do
        sign_in user

        patch :update, id: favorite, favorite: { user_id: user.id, tweet_id: favorite.tweet_id }

        expect(response).to redirect_to tweets_path
      end
    end

  end

end
