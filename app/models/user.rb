class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      if auth.provider == 'facebook'
        @token_url = "https://graph.facebook.com/oauth/access_token?client_id=#{ENV['FB_APP_ID']}&client_secret=#{ENV['FB_APP_SECRET']}&grant_type=fb_exchange_token&fb_exchange_token=#{auth.credentials.token}"
        long_term_token = HTTParty.get(@token_url)
        user.long_term_token = long_term_token['access_token']
        user.oauth_expires_at = Time.current + (long_term_token['expires_in'].to_i.seconds)
      elsif auth.provider == 'linkedin'
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
      user.save!
    end
  end
end
