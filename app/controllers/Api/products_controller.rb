class Api::ProductsController < ActionController::API
  def create
    CreateProduct.call(params: params)
   
    render json: {message: 'success'}
  end

  def index
    result = GetProducts.call(params: params)
    #return (render json:{message: result.message}, 400) if context.failure?

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
