require 'rails_helper'

RSpec.describe Admin::Users::PasswordsController, type: :controller do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe 'PATCH #update' do

    context 'when user non-admin' do
      it 'redirects to home page' do
        sign_in user

        put :update, user_id: user, user: { password: 'password', password_confirmation: 'password' }

        expect(response).to redirect_to tweets_path
      end
    end

    context 'when user admin' do

      before do
        sign_in admin
      end

      it 'renders the edit page if request is invalid' do
        put :update, user_id: user, user: { password: 'password', password_confirmation: 'invalid' }

        expect(response).to render_template('edit')
      end

      it 'updates the user if request is valid' do
        put :update, user_id: user, user: { password: 'password', password_confirmation: 'password' }

        expect(response).to redirect_to admin_users_path
      end
    end

  end

end
