Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.credentials.dig(:github, :id),
           Rails.application.credentials.dig(:github, :password)

  provider :facebook, Rails.application.credentials.dig(:facebook, :id),
           Rails.application.credentials.dig(:facebook, :password)
end
