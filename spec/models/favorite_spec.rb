require 'rails_helper'

RSpec.describe Favorite, type: :model do

  describe 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :tweet }
  end

  describe 'Validations' do
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:tweet_id) }
    it { is_expected.to validate_uniqueness_of(:tweet_id).scoped_to(:user_id) }
  end

end
