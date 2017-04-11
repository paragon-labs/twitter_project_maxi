require 'rails_helper'

describe UsersHelper do

  describe 'format_email' do

    let(:user) { build :user, email: 'user@test.test' }

    it 'formats a user email' do
      expect(format_email(user)).to start_with('user')
    end

  end

  describe 'admin_role?' do

    context 'when user is admin' do
      let(:admin) { build :admin }

      it 'is an admin user' do
        expect(admin_role?(admin)).to be_truthy
      end
    end

    context 'when user is admin' do
      let(:user) { build :user }

      it 'is not an admin user' do
        expect(admin_role?(user)).to be_falsey
      end
    end

  end

end
