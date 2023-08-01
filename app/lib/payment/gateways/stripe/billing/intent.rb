module Payment
  module Gateways
    module Stripe
      module Billing
        class Intent
          def self.create(stripe_customer:, stripe_payment_method:, offer:)
            ::Stripe::PaymentIntent.create({ amount: offer.price_cents, currency: offer.currency,
                                             payment_method: stripe_payment_method, customer: stripe_customer })
          end
        end
      end
    end
  end
end
