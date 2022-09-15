# == Schema Information
#
# Table name: stories
#
#  id            :bigint           not null, primary key
#  active        :boolean
#  description   :text
#  position      :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  non_profit_id :bigint           not null
#
FactoryBot.define do
  factory :story do
    title { 'Story' }
    description { 'Description' }
    non_profit_id { 1 }
    position { 1 }
    active { true }
  end
end