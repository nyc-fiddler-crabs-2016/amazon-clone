class OrdersController < ApplicationController
def show
  @order= Order.find(params[:id])
end

def edit
  @order = Order.find(params[:id])
  @addresses = current_user.addresses
end

def update
  @order = Order.find(params[:id])
  if @order.update(address_id: order_params)
    @order.update(shopped_now: false)
    flash[:notice] = "Your order has been shipped!"
    @order = current_user.orders.create
    redirect_to order_path(@order)
  else
    flash[:notice] = "Something went wrong with your order placement"
    redirect_to order_path(@order)
  end
end

# def create
#   @order = Order.create
#   redirect_to order_path(@order)

# end

 def order_params
    params.require(:order).permit(:address_id)
  end



end




