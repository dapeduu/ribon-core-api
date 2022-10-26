module Donations
  class RetryDonationsJob < ApplicationJob
    queue_as :default

    def perform
      UpdateProcessingDonations.call
      UpdateApiOnlyDonations.call
      UpdateFailedDonations.call
    end
  end
end