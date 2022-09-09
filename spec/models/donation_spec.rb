# == Schema Information
#
# Table name: donations
#
#  id             :bigint           not null, primary key
#  value          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  integration_id :bigint           not null
#  non_profit_id  :bigint           not null
#  user_id        :bigint
#
# Indexes
#
#  index_donations_on_integration_id  (integration_id)
#  index_donations_on_non_profit_id   (non_profit_id)
#  index_donations_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (integration_id => integrations.id)
#  fk_rails_...  (non_profit_id => non_profits.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe '.validations' do
    subject { build(:donation) }

    it { is_expected.to belong_to(:non_profit) }
    it { is_expected.to belong_to(:integration) }
    it { is_expected.to belong_to(:user) }
  end
end
