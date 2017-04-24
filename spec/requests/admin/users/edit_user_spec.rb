require 'rails_helper'

describe 'Edit Users' do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit edit_admin_user_path(user)
  end

  it 'edits a user' do
    fill_in 'Email', with: user.email
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'User updated successfully.')
  end

  it 'has the option to upload a file' do
    expect(page).to have_field('user_avatar')
  end

end
