class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @sum=0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.amount != nil
      @cart_item_check_box = CartItem.find_by(customer_id: current_customer.id, item_id: cart_item_params[:item_id])
      if @cart_item_check_box
        @cart_item_check_box.amount += cart_item_params[:amount].to_i
        @cart_item_check_box.save
      else
        @cart_item.customer_id = current_customer.id
        @cart_item.save
      end
    end
    redirect_to cart_items_path

  end

  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items.all
      @sum=0
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id,:item_id, :amount)
  end
end
