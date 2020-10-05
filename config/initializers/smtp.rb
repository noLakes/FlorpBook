#for sendgrid
ActionMailer::Base.smtp_settings = {
  domain: "https://radiant-sea-37789.herokuapp.com/",
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      'apikey',
  password:       ENV['SENDGRID_API_KEY']
}