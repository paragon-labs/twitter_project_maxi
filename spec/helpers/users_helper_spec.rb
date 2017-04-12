require 'rails_helper'

describe UsersHelper do

  let(:user) { build :user, email: 'user@test.test' }

  describe 'Format email' do

    it 'formats a user email' do
      expect(format_email(user)).to start_with('user')
    end

  end

  describe 'Admin role' do

    let(:user) { build :user }
    let(:admin) { build :admin }

    it 'is an admin user' do
      expect(admin_role?(admin)).to eq(true)
    end
    it 'is not an admin user' do
      expect(admin_role?(user)).to eq(false)
    end

  end

end
