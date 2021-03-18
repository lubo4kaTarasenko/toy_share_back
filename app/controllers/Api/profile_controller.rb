class Api::ProfileController < ActionController::API
  def index
   
  end

  def products
    products = Product.where(status: params[:status], kind: params[:kind].to_s.split(',') ).includes(
      :category, :subcategory, :images).map do |product|
      product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name,
        images: product.images
      )
    end 
    render json: { products: products }
  end
end