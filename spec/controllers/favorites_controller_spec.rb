require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  describe 'POST #create' do

    let(:user) { create(:user_with_tweets) }
    let(:tweet) { build(:tweet) }
    before do
      sign_in user
    end

    context 'adding a new favorite' do
      it 'should add the new favorite' do
        expect { post :create, tweet: { number: tweet.number, text: 'some_text' } }.to change{ user.faved_tweets.count }.by(1)
      end
    end

  end

end
