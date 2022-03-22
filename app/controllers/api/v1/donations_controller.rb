module Api
  module V1
    class DonationsController < ApplicationController
      def create
        authorize!(:create, Donation, message: 'Unable to donate now. Wait for your next donation.')

        command = Donations::Donate.call(integration: integration,
                                         non_profit: non_profit,
                                         user: user)

        if command.success?
          head :ok
        else
          head :unprocessable_entity
        end
      end

      private

      def integration
        @integration ||= Integration.find donation_params[:integration_id]
      end

      def non_profit
        @non_profit ||= NonProfit.find donation_params[:non_profit_id]
      end

      def user
        @user ||= User.find_by(email: donation_params[:email])
      end

      def donation_params
        params.permit(:integration_id,
                      :non_profit_id, :email)
      end
    end
  end
end
