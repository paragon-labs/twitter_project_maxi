require 'rails_helper'

describe 'Edit Profile' do

  let(:user) { create(:user) }

  before do
    login_as user
  end

  it 'edits user email' do
    visit edit_profile_path

    fill_in 'Email', with: user.email
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'Profile updated successfully.')
  end

end
