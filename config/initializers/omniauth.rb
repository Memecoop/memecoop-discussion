Rails.application.config.middleware.use OmniAuth::Builder do

  # Uncomment one of the following blocks, depending on which environment this instance will run in.

  # Memecoop-dev
  #ca_file = '/usr/lib/ssl/certs/ca-certificates.crt'
  #fb_app_id = '265123856864145'
  #fb_app_secret = '91bb874df8838572395f21c90c5c70e2'

  # Memecoop
  ca_file = '/usr/lib/ssl/certs/ca-certificates.crt'
  fb_app_id = '233072326756470'
  fb_app_secret = 'f72cc12399c2dafed0d05570928ab0a7'

  # Local development ("127.0.0.1:3000/")
  #ca_file = "#{Rails.root}/config/ca-bundle.crt"
  #fb_app_id = '193251400751735'
  #fb_app_secret = '6f5dadd17197f7c3c71d920d4fc5d1e3'

  provider :facebook, fb_app_id, fb_app_secret,
      {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => ca_file}}}
end