ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "mail.farmaciaecovita.com.br",
  :port => 587,
  :domain => "farmaciaecovita.com.br",
  :user_name => "vendas@farmaciaecovita.com.br",
  :password => "vendas@@@",
  :authentication => :login,
  :enable_starttls_auto => false  
}
ActionMailer::Base.default_url_options[:host] = "localhost:3000"