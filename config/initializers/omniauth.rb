Rails.application.config.middleware.use OmniAuth::Builder do

  # Try to get FB Connect settings from the environment; otherwise default to local development,
  # using an app corresponding to http://127.0.0.1:3000/.

  ca_file = ENV['CA_FILE'] || "#{Rails.root}/config/ca-bundle.crt"
  fb_app_id = ENV['FB_APP_ID'] || '193251400751735'
  fb_app_secret = ENV['FB_APP_SECRET'] || '6f5dadd17197f7c3c71d920d4fc5d1e3'

  provider :facebook, fb_app_id, fb_app_secret,
      {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => ca_file}}}
end