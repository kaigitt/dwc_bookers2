ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail',
  port: 587,
  user_name: 's12201600350@gmail.com',
  password: 'smfgayuxsoiwyqcx',
  authentication: 'plain',
  enable_starttls_auto: true
}