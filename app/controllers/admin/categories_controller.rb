class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["ADM_NAME"], password: ENV["ADM_PASS"]

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      # redirect_to [:admin, :category, :index], notice: 'Category created!'
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name
    )
  end
end
