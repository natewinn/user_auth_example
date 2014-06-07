Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '567949006656773', '34b72698d02c09fc7ab5aec9d92b981d', display: "popup"
end