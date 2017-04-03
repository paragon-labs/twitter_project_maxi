require 'rails_helper'

describe 'Log in / Log out' do

  let(:user) { create(:user) }

  it 'fails to sign up' do
    visit new_user_session_path

    fill_in 'Email', with: 'test@test.test'
    fill_in 'Password', with: 'password'
    click_button  'Log in'

    expect(page).to have_css('.alert-warning', text: 'Invalid Email or password.')
  end

  it 'signs up' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button  'Log in'

    expect(page).to have_css('.alert-info', text: 'Signed in successfully.')
  end

  it 'signs out' do
    login_as user

    visit home_index_path
    click_link 'Logout'

    expect(page).to have_content('Log in')
  end

end
