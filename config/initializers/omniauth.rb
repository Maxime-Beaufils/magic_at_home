Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "fb_KEY", "fb_secret"
    {
        :secure_image_url => 'true',
        :image_size => 'original',
        :authorize_params => {
          :force_login => 'true',
          :lang => 'pt'
        }
      }
   end
