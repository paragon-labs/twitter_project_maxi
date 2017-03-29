require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { build :user }

  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }
  it { is_expected.to respond_to(:admin) }

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it "is invalid without a proper email format" do
      expect(build(:user, email: 'testattest.com')).not_to be_valid
    end
  end
end
