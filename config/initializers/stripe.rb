if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_83ObGEyRvRMF1ziWA5VBTiBU',
    secret_key: 'sk_test_lbEUSBMUAq1125JYgFbSGBA2'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
