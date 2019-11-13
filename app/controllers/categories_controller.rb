class CategoriesController < ApplicationController
  before_action :set_selling

  def index
  @roots = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    @children = @category.children
    @indirect_items = @selling_items.where(category_id: @category.indirects.ids).page(params[:page]).per(130)
    @self_items = @selling_items.where(category_id: @category.id).page(params[:page]).per(130)
  end
end
