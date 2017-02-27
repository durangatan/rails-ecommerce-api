class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :set_images, only: :show

  def index
    @items = Item.all_with_category_ids
    json_response(@items)

  end

  def create
    @item = Item.create!(item_params)
    json_response(@item, :created)
  end

  def show
    response = {
      item: @item,
      images: @images
    }
    json_response(response)

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

  def set_images
    @images = Image.where(imageable_id:params[:id])
  end
end
