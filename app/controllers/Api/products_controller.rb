class Api::ProductsController < ActionController::API
  def create
    CreateProduct.call(params: params, user: current_user)
   
    render json: {message: 'success'}
  end

  def index
    result = GetProducts.call(params: params)
    #return (render json:{message: result.message}, 400) if context.failure?
    email = current_user.email  if current_user  
    render json: { products: result.products, pages: result.pages_count, user: email }
  end

  def show
    product = Product.find_by(url_name: params[:name])
    comments_arr = product.comments.map { |c| { id: c.id, body: c.body, email: c.user.email } }
 
    render json: {
      product: product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name,
        images: product.images.pluck(:url),
        user: product.user.email
      ),  
      comments: comments_arr
    }
  end 
  
  def delete 
    product = Product.find(params[:id])
    product.delete
    render json: {success: true}
  end

  def wanna_thing
    product = Product.find(params[:id])
    UserMailer.with(user_email: current_user.email, product: product).proposal_email.deliver_now
    render json: {success: true}
  end
end
