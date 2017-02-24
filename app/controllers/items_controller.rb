class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = Item.all
    json_response(@items)
  end

  def create
    @item = Item.create!(item_params)
    json_response(@item, :created)
  end

  def show
    json_response(@item)
  end

  def update
    @item.update(item_params)
    head :no_content
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :price, :availability, :unique)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end