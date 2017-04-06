require 'rails_helper'

RSpec.describe Profiles::PasswordsController, type: :controller do

  let(:user) { create(:user) }

  describe 'PATCH #update' do

    before do
      sign_in user
    end

    it 'renders the edit page if request is invalid' do
      put :update, user: { password: 'password', password_confirmation: 'invalid' }

      expect(response).to render_template('edit')
    end

    it 'updates the user if request is valid' do
      put :update, user: { password: 'password', password_confirmation: 'password' }

      expect(response).to redirect_to tweets_path
    end

  end

end
