OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["OAUTH_CLIENT_ID"], ENV["OAUTH_CLIENT_SECRET"], { client_options: { ssl: { ca_file: Rails.root.join("cacert.pem").to_s}}, hd: 'gmail.com'}
end
