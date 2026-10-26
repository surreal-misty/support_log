class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
     @interactions = @customer.interactions.order(occurred_at: :desc)
  end
end
