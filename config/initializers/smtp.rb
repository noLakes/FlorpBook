#with api key
#ActionMailer::Base.smtp_settings = {
#  domain: "https://radiant-sea-37789.herokuapp.com/",
#  address:        "smtp.sendgrid.net",
#  port:            587,
#  authentication: :plain,
#  user_name:      'apikey',
#  password:       ENV['SENDGRID_API_KEY']
#}

#without api key
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'https://radiant-sea-37789.herokuapp.com/',
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}