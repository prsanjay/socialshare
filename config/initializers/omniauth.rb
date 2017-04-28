OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'app-id', 'app-secret',
  scope: 'email,user_birthday,publish_actions'
end