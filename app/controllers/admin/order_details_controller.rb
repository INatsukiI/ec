class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)

    if @order_detail.production_status == 'now_product'
      @order_detail.order.update(order_status: 2)
    end

    if @order_detail.order.order_details.count == @order_detail.order.order_details.where(production_status: 'comp_product').count
      @order_detail.order.update(order_status: 3)
    end

    redirect_to  admin_order_path(@order_detail.order.id)

  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
