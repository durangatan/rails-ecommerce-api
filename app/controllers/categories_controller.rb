class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :authenticate_customer!, only: [:create, :update, :destroy]
  before_action :admin_only!, only: [:create, :update, :destroy]

  def index
    @categories = Category.all_nested
    json_response(@categories)
  end

  def create
    @category = Category.create!(category_params)
    json_response(@category, :created)
  end

  def show
    json_response(@category)
  end

  def update
    @category.update(category_params)
    head :no_content
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    params.permit(:thumbnail, :parent_id, :name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
