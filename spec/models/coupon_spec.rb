# == Schema Information
#
# Table name: coupons
#
#  id                 :uuid             not null, primary key
#  available_quantity :integer
#  expiration_date    :datetime
#  number_of_tickets  :integer
#  reward_text        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe '.validations' do
    subject { build(:coupon) }

    it { is_expected.to have_many(:user_coupons) }
    it { is_expected.to have_many(:user_expired_coupons) }
    it { is_expected.to validate_presence_of(:number_of_tickets) }
    it { is_expected.to validate_presence_of(:reward_text) }
    it { is_expected.to validate_presence_of(:expiration_date) }
  end
end
