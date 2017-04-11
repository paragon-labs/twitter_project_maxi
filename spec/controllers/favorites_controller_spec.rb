require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  describe 'POST #create' do

    let(:user) { create(:user_with_tweets) }

    before do
      sign_in user
    end

    context 'adding a new favorite' do
      it 'should add the new favorite' do
        expect { post :create, tweet: { number: 500, text: 'some_text' }}.to change{ user.faved_tweets.count }.by(1)
      end
    end

    context 'adding an already faved tweet' do
      it 'should not add the tweet' do
        tweet_id = user.faved_tweets.first.number

        expect { post :create, tweet: { number: tweet_id, text: 'some_text' } }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

  end

end
