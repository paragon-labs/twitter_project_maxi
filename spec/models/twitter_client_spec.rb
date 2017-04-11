require 'rails_helper'

RSpec.describe TwitterClient, type: :model do

  context 'Tweets Page', :vcr do

    it 'searches tweets from Uruguay' do
      expect(TwitterClient.new.search('Uruguay')).to be_a Twitter::SearchResults
    end

  end

end
