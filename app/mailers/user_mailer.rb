class UserMailer < ApplicationMailer
  default from: "shwetzpatil@gmail.com"
  
    def contact_form(email, name, message)
      @message = message
      mail(from: email,
           to: 'shwetzpatil@gmail.com, sagarpatil8890@gmail.com'
           subject: "A new contact form message from #{name}")
    end
end
