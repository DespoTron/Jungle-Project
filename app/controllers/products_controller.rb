class ProductsController < ApplicationController

  def index
    # uses MODEL
    @products = Product.all.order(created_at: :desc)
    # uses VIEW
    render :index
  end

  def show
    @product = Product.find params[:id]
    # implicit render
    # render :show
  end

end
