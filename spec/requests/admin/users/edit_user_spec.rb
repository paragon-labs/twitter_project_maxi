require 'rails_helper'

describe 'Edit Users' do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  before do
    login_as admin
  end

  it 'edits a user' do
    visit edit_admin_user_path(user)

    fill_in 'Email', with: user.email
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'User updated successfully.')
  end

end
