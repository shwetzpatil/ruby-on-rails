class OrdersController < ApplicationController

  before_action :authenticate_user!
    
    # GET /products
    def index
      @orders = Order.all
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