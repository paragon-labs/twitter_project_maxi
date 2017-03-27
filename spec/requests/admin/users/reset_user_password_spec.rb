require 'rails_helper'

describe 'Reset Users Password' do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  before do
    login_as admin
  end

  it 'resets a user password' do
    visit edit_admin_user_path(user)

    click_link 'Reset User\'s Password'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'Password changed successfully.')
  end

end
