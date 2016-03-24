class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @review = Review.new

  end

  def update
    @item = Item.find(params[:id])

    @order = Order.find_by(id: params[:order_id])
    @order.items << @item
    flash[:notice] = "Item added"
    redirect_to category_item_path(@item.category,@item)
  end
end
