require 'rails_helper'

RSpec.describe Tweet, type: :model do

  subject(:tweet) { build(:tweet) }

  describe 'Associations' do
    it { is_expected.to have_many(:favorites).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:favorites) }
    it { is_expected.to have_many(:tweet_images).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_uniqueness_of :number }
    it { is_expected.to validate_attachment_content_type(/\Aimage\/.*\z/) }
  end

end
