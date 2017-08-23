class CartAdditionsController < ApplicationController
  before_action :set_cart_addition, only: [:show, :update, :destroy]
  before_action :authenticate_customer!
  before_action :admin_only!, only: [:destroy]
  before_action :self_only!, only: [:create, :show, :update, :upsert]

  def index
    @cart_additions = CartAddition.all
    json_response(@cart_additions)
  end

  def create
    @cart_addition = CartAddition.create!(cart_addition_params)
    json_response(@cart_addition, :created)
  end

  def show
    json_response(@cart_addition)
  end

  def update
    @cart_addition.update(cart_addition_params)
    head :no_content
  end

  def upsert
    @cart_addition = CartAddition.find_or_create_by(cart_addition_params)
    json_response(@cart_addition)
  end

  def destroy
    @cart_addition.destroy
    head :no_content
  end

  private

  def cart_addition_params
    params.permit(:customer_id, :quantity, :item_id, :active)
  end

  def set_cart_addition
    @cart_addition = CartAddition.find(params[:id])
  end

  def self_only!
    return json_response({}, :unauthorized) unless cart_addition_params[:customer_id] == @customer.id || @customer.admin
  end

end
