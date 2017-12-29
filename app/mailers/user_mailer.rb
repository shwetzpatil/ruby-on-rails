class UserMailer < ApplicationMailer
  default from: "shwetzpatil@gmail.com"
  
    def contact_form(email, name, message)
      @message = message
      mail(from: email,
           to: 'shwetzpatil@gmail.com',
           subject: "A new contact form message from #{name}")
    end
    def welcome(user)
      @appname = "CoverGirl"
      mail(to: user.email,
           subject: "Welcome to #{@appname}!")
    end
end
