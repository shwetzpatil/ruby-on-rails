class OrdersController < ApplicationController

  before_action :authenticate_user!
    
    # GET /products
    def index
      @order="Your order is here"
    end

    def show
    end
    
    def new
    end

    def create
    end
    
    def destroy
    end

end  