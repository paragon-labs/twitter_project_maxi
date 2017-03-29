require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  let(:user) { create :user }

  describe "GET #index" do

    context "when user logged in" do
      it "renders Home index page" do
        sign_in user

        get :index

        expect(response.status).to eq 200
      end
    end

    context "when user logged off" do
      it "redirects to sign in page" do
        get :index

        expect(response.status).to eq 302
      end
    end
  end



end
