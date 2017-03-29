require 'rails_helper'

describe "Create Users" do

  let(:admin) { create(:admin) }

  before do
    login_as admin
  end

  it 'creates a new user' do
    visit admin_users_path

    click_link 'Create New User'
    fill_in 'Email', with: 'newtest@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'User successfully created.')
  end



end
