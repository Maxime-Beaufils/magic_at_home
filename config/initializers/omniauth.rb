Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV["fb_KEY"], ENV["fb_secret"]
    {
        :secure_image_url => 'true',
        :image_size => 'original',
        :authorize_params => {
          :force_login => 'true',
          :lang => 'pt'
        }
      }
   end
