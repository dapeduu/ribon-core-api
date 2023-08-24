module Api
  module V1
    module Users
      class SubscriptionsController < ApplicationController
        def index
          ids = user.customers.pluck(:id)
          @subscriptions = Subscription.where(payer_id: ids, status: :active)

          render json: SubscriptionBlueprint.render(@subscriptions)
        end

        private

        def user
          @user ||= User.find params[:user_id]
        end
      end
    end
  end
end
