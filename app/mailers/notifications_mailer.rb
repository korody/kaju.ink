class NotificationsMailer < ActionMailer::Base
  default from: "noreply@youdomain.dev"
  default to: "hello@kajuink.com"

  def new_message(message)
    @message = message
    mail(subject: "Hello from kajuink.com: #{message.subject}")
  end
end
