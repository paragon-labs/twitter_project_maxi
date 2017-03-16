class HomeController < ApplicationController

  before_action :admin?

  def index
    @admin = admin?
  end

  private

  def admin?
    unless current_user.admin?
      render 'index'
    end
  end

end
