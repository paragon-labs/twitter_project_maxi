require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  let(:user) { create(:user_with_tweets) }

  before do
    sign_in user
  end

  setup do
    @request.env['HTTP_REFERER'] = favorites_path
  end

  describe 'GET #index' do
    context 'listing favorites' do
      it 'should list all my favorites' do
        get :index

        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do

    context 'adding a new favorite' do
      it 'should add the new favorite' do
        expect { post :create, tweet: { number: 500, text: 'some_text' } }.to change{ user.faved_tweets.count }.by(1)
      end
    end

    context 'adding an already faved tweet' do
      it 'should not add the tweet' do
        tweet_id = user.faved_tweets.first.number

        expect { post :create, tweet: { number: tweet_id, text: 'some_text' } }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

  end

  describe 'DELETE #destroy' do
    context 'unfavorite a tweet' do
      it 'deletes a favorite' do
        tweet = user.faved_tweets.first

        expect{ delete :destroy, id: tweet.number }.to change{ Favorite.count }.by(-1)
      end
    end
  end

end
