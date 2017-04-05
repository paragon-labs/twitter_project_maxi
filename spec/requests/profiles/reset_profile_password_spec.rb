require 'rails_helper'

describe 'Reset Profile Password' do

  let(:user) { create(:user) }

  before do
    login_as user
  end

  it 'resets user password' do
    visit edit_profile_path(user)

    click_link 'Reset My Password'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Done'

    expect(page).to have_css('.alert-warning', text: 'You need to sign in or sign up before continuing.')
  end

end
