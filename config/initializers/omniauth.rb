OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET'],
  scope: 'publish_actions,email,user_birthday'

  provider :linkedin, ENV['LINK_CLIENT_ID'], ENV['LINK_CLIENT_SECRET'],:scope => 'r_basicprofile w_share'
end
