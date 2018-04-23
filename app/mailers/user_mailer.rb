class UserMailer < ApplicationMailer
  default from: "shwetzpatil@gmail.com"
  
    def contact_form(email, name, message)
      @message = message
      @name = name
      @email = email
      mail(from: email,
           to: 'shwetzpatil@gmail.com',
           subject: "A new contact form message from #{@name}")
    end
    def welcome(user)
      @appname = "CoverGirl"
      @username = user.first_name
      mail(to: user.email,
           subject: "Welcome to #{@appname}!") 
    end

    def order_placed(user, order)
      @orderUserName = order.user.first_name
      @orderName = order.product.name
      @orderTotal = order.total
      puts "here : #{ @orderName} & #{@orderTotal}"
      mail(to: user.email,
        subject: "hello #{@orderUserName}, Thank you for purchasing #{@orderName}.") 
    end
end
