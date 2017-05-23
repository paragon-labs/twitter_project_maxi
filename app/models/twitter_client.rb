class TwitterClient

  delegate :search, to: :@client
  delegate :user, to: :@client
  delegate :user_timeline, to: :@client
  delegate :followers, to: :@client
  delegate :friends, to: :@client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
      config.access_token = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end

end
