require 'rails_helper'

describe 'List Users' do

  let(:admin) { create(:admin) }
  let!(:users) { create_list(:user, 9) }

  before do
    login_as admin
    visit admin_users_path
  end

  context 'actions' do
    it 'has the proper Edit link' do
      first(:link, href: edit_admin_user_path(admin)).click

      expect(page).to have_content('Edit User')
    end
    it 'has the proper Delete link' do
      expect(page).to have_link(href: admin_user_path(admin))
    end
  end

  context 'paginating 10 users' do
    let!(:users) { create_list(:user, 10) }
    it 'lists all users' do
      expect(page).to have_selector('table tr', count: 10)
    end
  end

end
