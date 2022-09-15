# == Schema Information
#
# Table name: causes
#
#  id      :bigint           not null, primary key
#  name    :string
#  pool_id :bigint           not null
#
require 'rails_helper'

RSpec.describe Cause, type: :model do
  describe '.validations' do
    subject { build(:cause) }

    it { is_expected.to validate_presence_of(:name) }
  end

  describe '.associations' do
    subject { build(:cause) }

    it { is_expected.to belong_to(:pool) }
    it { is_expected.to have_many(:non_profits) }
  end
end