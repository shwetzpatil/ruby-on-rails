class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
     # Create variable to find the instance variable in the hidden field of _strip_checkout
    puts "In here"
     @product = Product.find(params[:product_id])

    # Check if user is signed in otherwise redirect to create new user
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_registration_path
    end

    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i,
        currency: "gbp",
        source: token,
        receipt_email: @user.email,
        description: params[:stripeEmail]
      )
      puts "Charge created"
      if charge.paid
        Order.create(
          user_id: @user.id,
          product_id: params[:product_id],
          total: @product.price * 100,
          )
          puts "Order created"
          flash[:notice] = "Thank you for purchasing #{@product.name}!"
      end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end

end
