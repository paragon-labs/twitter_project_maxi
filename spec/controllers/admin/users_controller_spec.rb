require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe 'GET index' do

    context 'when logged off' do
      it 'redirects to sign in page' do
        get :index

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      it 'has a 302 status code for non-admin users' do
        get :index

        expect(response).to have_http_status(302)
      end

      it 'redirects non-admin users to home' do
        sign_in user

        get :index

        expect(response).to redirect_to(tweets_path)
      end

      it 'has a 200 status code for admin' do
        sign_in admin

        get :index

        expect(response).to have_http_status(:success)
      end
    end

  end

  describe 'POST #create' do

    context 'when user non-admin' do
      it 'redirects to home page' do
        sign_in user

        post :create, user: { email: 'test@test.test', password: 'password', password_confirmation: 'password' }

        expect(response).to redirect_to tweets_path
      end
    end

    context 'when user admin' do
      before do
        sign_in admin
      end

      it 'renders the new page if request is invalid' do
        post :create, user: { email: 'test@test.test', password: 'password', password_confirmation: '' }

        expect(response).to render_template('new')
      end

      it 'creates a new user if request is valid' do
        post :create, user: { email: 'test@test.test', password: 'password', password_confirmation: 'password' }

        expect(response).to redirect_to admin_users_path
      end
    end

  end

  describe 'PATCH #update' do

    context 'when user non-admin' do
      it 'redirects to home page' do
        sign_in user

        put :update, id: user, user: { email: 'test@test.test'}

        expect(response).to redirect_to tweets_path
      end
    end

    context 'when user admin' do
      before do
        sign_in admin
      end

      it 'renders the edit page if request is invalid' do
        put :update, id: user, user: { email: 'testtest.test'}

        expect(response).to render_template('edit')
      end

      it 'updates the user if request is valid' do
        put :update, id: user, user: { email: 'test@test.test' }

        expect(response).to redirect_to admin_users_path
      end
    end

  end

  describe 'DELETE #destroy' do
    let!(:new_user) { create :user, email: 'test@test.test' }

    context 'when user non-admin' do
      it 'redirects to home page' do
        sign_in user

        expect{ delete :destroy, id: new_user }.to_not change{ User.count }
      end
    end

    context 'when user admin' do
      it 'deletes the user if request is valid' do
        sign_in admin

        expect{ delete :destroy, id: new_user }.to change{ User.count }.by(-1)
      end
    end

  end

end
