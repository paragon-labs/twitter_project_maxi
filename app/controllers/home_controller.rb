class HomeController < ApplicationController

  def index
    @tweets = TwitterClient.new.search('Uruguay').take(10)
  end

end
