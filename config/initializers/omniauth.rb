Rails.application.config.middleware.use OmniAuth::Builder do

  # Certificate authority file location on Heroku
  ca_file = '/usr/lib/ssl/certs/ca-certificates.crt'
  # Facebook app ID for memecoop-dev
  fb_app_id = '265123856864145'
  # Facebook app secret for memecoop-dev
  fb_app_secret = '91bb874df8838572395f21c90c5c70e2'

  # Certificate authority file location on Fabric's machine
  #ca_file = "#{Rails.root}/config/ca-bundle.crt"
  # Facebook API key for local test
  #fb_app_id = '193251400751735'
  # Facebook app secret for local test
  #fb_app_secret = '6f5dadd17197f7c3c71d920d4fc5d1e3'

  provider :facebook, fb_app_id, fb_app_secret,
      {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => ca_file}}}
end