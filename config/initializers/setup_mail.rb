ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "mail.vanessaefabiano.com.br",
  :port => 587,
  :domain => "vanessaefabiano.com.br",
  :user_name => "resposta@vanessaefabiano.com.br",
  :password => "resposta@@@",
  :authentication => :login,
  :enable_starttls_auto => false  
}
ActionMailer::Base.default_url_options[:host] = "localhost:3000"