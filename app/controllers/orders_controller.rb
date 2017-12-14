class OrdersController < ApplicationController
    
    # GET /products
    def index
      @order="Your order is here"
    end

    def show
      @order = Order.find(params[:id])
    end
    
    def new
    end

    def create
    end
    
    def destroy
    end

end  