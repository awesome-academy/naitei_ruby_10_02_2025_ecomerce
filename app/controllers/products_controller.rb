class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = t "noti.create_product_success"
      redirect_to product_path(id: @product.id)
    else
      render :new
      flash[:danger] = t "noti.create_product_fail"
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = t "noti.update_product_success"
      redirect_to product_path(id: @product.id)
    else
      render :edit
      flash[:danger] = t "noti.update_product_fail"
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "noti.delete_product_success"
      redirect_to root_path
    else
      flash[:danger] = t "noti.delete_product_fail"
      redirect_to product_path(id: @product.id)
    end
  end

  private

  def product_params
    params.require(:product).permit(Product::PERMITTED_ATTRIBUTES)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    return unless @product.nil?

    flash[:danger] = t "noti.product_not_found"
    redirect_to root_path
  end
end
