# this initializer sets up our all with the stripe gem
# this is brand new in Rails 4.1
Stripe.api_key = Rails.application.secrets.stripe_secret