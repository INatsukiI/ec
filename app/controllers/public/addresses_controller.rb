class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.all
      @address = Address.new
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      redirect_to addresses_path
    else
      @addresses = Address.all
      @address = Address.new
      render :index
    end
  end


  private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end
