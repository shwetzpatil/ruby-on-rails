class UserRegistrationsController < Devise::RegistrationsController
  def create
    super
    puts "Happy New Year"
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
    end
  end
end