require 'rails_helper'

describe 'Edit Profile', :vcr do

  let(:user) { create(:user) }

  before do
    login_as user
    visit edit_profile_path
  end

  it 'edits user email' do
    fill_in 'Email', with: user.email
    click_button 'Done'

    expect(page).to have_css('.alert-info', text: 'Profile updated successfully.')
  end

  it 'has the option to upload a file' do
    expect(page).to have_field('user_avatar')
  end

end
