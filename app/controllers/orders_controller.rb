class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  before_action :authenticate_customer!

  def index
    @orders = Order.all
    json_response(@orders)
  end

  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  def show
    json_response(@order)
  end

  def update
    @order.update(order_params)
    head :no_content
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    params.permit(:customer_id, :purchases)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
