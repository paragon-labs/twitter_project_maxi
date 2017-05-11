require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { create :user_with_tweets }
  let(:tweet) { create :tweet }

  describe 'Attributes' do
    it { is_expected.to have_attached_file(:avatar) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:favorites).dependent(:destroy) }
    it { is_expected.to have_many(:faved_tweets).through(:favorites) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_attachment_content_type(/\Aimage\/.*\z/) }

    it 'is invalid without a proper email format' do
      expect(build(:user, email: 'testattest.test')).not_to be_valid
    end
  end

  describe 'favorite!' do

    it 'adds a new favorite to the user' do
      expect{ user.favorite!(tweet) }.to change{ user.faved_tweets.count }.by(1)
    end
    it 'does not add a favorite twice' do
      expect{ user.favorite!(user.faved_tweets.first) }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  describe 'faved?' do

    context 'the tweet is a favorite' do
      it 'returns the favorite' do
        expect(user.faved?(user.faved_tweets.first.number)).to_not eq(nil)
      end
    end

    context 'the tweet is not a favorite' do
      let(:tweet) { build(:tweet) }
      it 'returns nil' do
        expect(user.faved?(tweet.number)).to be_falsey
      end
    end

  end

end
