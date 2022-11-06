class Public::OrdersController < ApplicationController
  def new
    if current_customer.cart_items.blank?
      flash[:alert] = 'カートが空です'
      redirect_to cart_items_path
    else
      @order = Order.new
    end
  end

  def index
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:select_address] == '0'
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == '1'
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    end
    total=0
    current_customer.cart_items.each do |cart|
      total += cart.subtotal
    end
    @order.billing_amout = total + @order.postage
  end

  def create
    @order = Order.new(order_create_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.ordered_price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path

  end

  def complete
  end

  def show
  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end

  def order_create_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :billing_amout)
  end

end
