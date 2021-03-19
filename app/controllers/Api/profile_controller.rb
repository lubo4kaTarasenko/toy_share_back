class Api::ProfileController < ActionController::API
  def index
   
  end

  def products
    products = Product.where(status: params[:status], kind: params[:kind].to_s.split(','), user: current_user ).includes(
      :category, :subcategory, :images).map do |product|
      product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name,
        image: product.images[0]&.url,
        user: current_user.email
      )
    end 
    render json: { products: products }
  end
end