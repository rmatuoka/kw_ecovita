class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "---=== Farmacia Ecovita Teste de Email ===---"
    message.to = "bsilva@korewa.com.br"
    message.bcc = "bsilva@korewa.com.br"
  end
end