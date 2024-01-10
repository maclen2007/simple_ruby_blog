class ContactMailer < ApplicationMailer

    default from: 'noreply@example.com'

    def send_email(email_params)
      @email = email_params['email']
      @message = email_params['message']
      @phone = email_params['phone']
      m = mail(to: 'info@example.com', subject: 'Пришла заявка от пользователя')
      m.transport_encoding = "8bit"
      m.deliver
    end

end
