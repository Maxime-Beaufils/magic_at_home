Rails.application.config.middleware.use OmniAuth::Builder do
OmniAuth.config.logger = Rails.logger
end
