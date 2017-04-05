require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:user) { create :user }

  describe 'PATCH #update' do

    before do
      sign_in user
    end

    it 'renders the edit page if request is invalid' do
      put :update, user: { email: 'testtest.test'}

      expect(response).to render_template('edit')
    end

    it 'updates the user if request is valid' do
      put :update, user: { email: 'test@test.test' }

      expect(response).to redirect_to home_index_path
    end

  end

end
