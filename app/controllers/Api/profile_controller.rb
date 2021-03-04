class Api::ProfileController < ActionController::API
  def index
   
  end

  def products
    products = Product.where(status: params[:status], kind: params[:kind].to_s.split(',') ).includes(:category, :subcategory).map do |product|
      product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name
      )
    end 
    render json: { products: products }
  end
end