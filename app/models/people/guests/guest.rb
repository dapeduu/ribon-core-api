# == Schema Information
#
# Table name: guests
#
#  id             :uuid             not null, primary key
#  wallet_address :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  person_id      :uuid
#
class Guest < ApplicationRecord
  include UuidHelper

  belongs_to :person
  validates :wallet_address, presence: true
end
