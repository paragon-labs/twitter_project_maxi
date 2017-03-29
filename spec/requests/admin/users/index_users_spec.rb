require 'rails_helper'


describe "List Users" do

  let(:admin) { create(:admin) }

  before do
    login_as admin
    visit admin_users_path
  end

  it "lists all users" do
    expect(page).to have_content('Users')
  end

  it "has the proper Edit link" do
    first(:link, 'Edit').click
    expect(page).to have_content('Edit User')
  end

  it "has the proper Delete link" do
    expect(page).to have_link 'Delete'
  end

end
