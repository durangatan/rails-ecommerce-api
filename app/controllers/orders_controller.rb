class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  before_action :authenticate_customer!, only: [:show, :update, :index, :destroy]
  before_action :admin_only!, only: [:destroy, :index]
  before_action :own_orders_only!, only: [:show, :update]
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

  def own_orders_only!
    return json_response({} ,:unauthorized) unless (order_params[:customer_id] == @customer.id) || @customer.admin
  end
end
