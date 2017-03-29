require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe "GET index" do

    context 'when logged off' do
      it "redirects to sign in page" do
        get :index

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      it "has a 302 status code for non-admin users" do
        get :index

        expect(response.status).to eq(302)
      end

      it "redirects non-admin users to home" do
        sign_in user

        get :index

        expect(response).to redirect_to(home_index_path)
      end

      it "has a 200 status code for admin" do
        sign_in admin

        get :index

        expect(response.status).to eq(200)
      end
    end

  end

  describe "POST #create" do

    context 'when user non-admin' do
      it "redirects to home page" do
        sign_in user

        post :create, user: { email: 'user@gmail.com', password: 'password', password_confirmation: 'password' }

        expect(response).to redirect_to home_index_path
      end
    end

    context 'when user admin' do
      it "renders the new page if request is invalid" do
        sign_in admin

        post :create, user: { email: 'user@gmail.com', password: 'password', password_confirmation: '' }

        expect(response).to render_template('new')
      end

      it "creates a new user if request is valid" do
        sign_in admin

        post :create, user: { email: 'user@gmail.com', password: 'password', password_confirmation: 'password' }

        expect(response).to redirect_to admin_users_path
      end
    end

  end

  describe "PATCH #update" do

    context 'when user non-admin' do
      it "redirects to home page" do
        sign_in user

        put :update, id: user, user: { email: 'user@gmail.com'}

        expect(response).to redirect_to home_index_path
      end
    end

    context 'when user admin' do
      it "renders the edit page if request is invalid" do
        sign_in admin

        put :update, id: user, user: { email: 'usergmail.com'}

        expect(response).to render_template('edit')
      end

      it "updates the user if request is valid" do
        sign_in admin

        put :update, id: user, user: { email: 'user@gmail.com' }

        expect(response).to redirect_to admin_users_path
      end
    end

  end

  describe "DELETE #destroy" do
    let!(:new_user) { create :user, email: 'new@test.com' }

    context 'when user non-admin' do
      it "redirects to home page" do
        sign_in user
        current_count = User.count

        delete :destroy, id: new_user

        expect(User.count).to eq current_count
      end
    end

    context 'when user admin' do
      it "deletes the user if request is valid" do
        sign_in admin
        current_count = User.count

        delete :destroy, id: new_user

        expect(User.count).to eq current_count-1
      end
    end
    
  end

end
