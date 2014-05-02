Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_key, Rails.application.secrets.twitter_secret
  provider :facebook, Rails.application.secrets.facebook_key, Rails.application.secrets.facebook_secret
  provider :linkedin, Rails.application.secrets.linkedin_key, Rails.application.secrets.linkedin_secret
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
