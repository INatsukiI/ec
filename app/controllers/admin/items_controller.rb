class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :new
    end
  end

  def search
    @items = Item.search(params[:keyword])
    render "index"
  end




  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :description, :without_tax_price, :is_sale, :product_image)
  end
end
