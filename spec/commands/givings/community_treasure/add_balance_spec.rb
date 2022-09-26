# frozen_string_literal: true

require 'rails_helper'

describe Givings::CommunityTreasure::AddBalance do
  describe '.call' do
    subject(:command) { described_class.call(amount:) }

    let(:amount) { 0.5 }
    let(:ribon_contract) { instance_double(Web3::Contracts::RibonContract) }
    let(:donation_pool_address) { '0xP000000000000000000000000000000000000000' }

    before do
      allow(Web3::Contracts::RibonContract).to receive(:new).and_return(ribon_contract)
      allow(ribon_contract).to receive(:add_pool_balance)
      create(:ribon_config)
      create(:chain)
    end

    it 'calls ribon contract add_pool_balance with correct args' do
      command

      expect(ribon_contract).to have_received(:add_pool_balance).with(donation_pool_address:, amount:)
    end
  end
end
