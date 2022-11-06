class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @cusomers = Customer.all
  end
end
