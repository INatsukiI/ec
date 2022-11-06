class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    @order.update(order_params)

    if @order.order_status == 'confirm_payment'
      @order_details.update_all(production_status: 1)
    end
    redirect_to admin_order_path(@order.id)

  end



  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
