Rails.application.config.middleware.use OmniAuth::Builder do
 provider OmniAuth::Strategies::GoogleOauth2, ENV["KEY"], ENV["SECRET"]
 provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
