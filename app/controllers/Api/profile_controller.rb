class Api::ProfileController < ActionController::API
  def index
   
  end

  def products
    find_products(current_user)   
  end

  def user_products
    find_products(User.find_by(email: params[:email]))   
  end

  def find_products(user)
    products = Product.where(status: params[:status], kind: params[:kind].to_s.split(','), user: user ).includes(
      :category, :subcategory, :images).map do |product|
      product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name,
        image: product.images[0]&.url,
        user: user.email
      )
    end 
    render json: { products: products }
  end
end