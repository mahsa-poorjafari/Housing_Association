class DevelopmentMailInterceptor

  def self.delivering_email(message)
    message.to = "mb.sepanta@gmail.com"
  end

end
