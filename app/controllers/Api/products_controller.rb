class Api::ProductsController < ActionController::API
  def create
    json = params.require(:product).permit(:name, :description, :kind).to_h
    json.merge!(user_id: current_user.id)
    #Product.create(json)
  end

  def index
    result = GetProducts.call(params: params)
    user = {email: current_user.email } if current_user  
    render json: { products: result.products, pages: result.pages_count, user: user }
  end

  def show
    product = Product.find_by(url_name: params[:name])

    render json: {
      product: product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name
    )}
  end  
end
