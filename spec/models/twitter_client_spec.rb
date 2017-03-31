require 'rails_helper'

RSpec.describe TwitterClient, type: :model do

    it 'is a valid TwitterClient' do
      expect(TwitterClient.new).to be_a TwitterClient
    end

    it 'returns a search result' do
      expect(TwitterClient.new.search('Uruguay')).to be_a Twitter::SearchResults
    end

end
