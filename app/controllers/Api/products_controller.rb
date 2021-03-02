class Api::ProductsController < ActionController::API
  def create
    #binding.pry
    uploaded_pictures = []
    params[:data].each{|k , v| uploaded_pictures << Cloudinary::Uploader.upload(v.path)}
   
    product = JSON.parse(params[:product])
    product_new = Product.create!(
      name: product['name'],
      description: product['description'], 
      kind: product[:kind],
      user_id: 1,
      category_id: 15,
      subcategory_id: 78
    )
    uploaded_pictures.each { |picture| product_new.images.create(url: picture['url'])} 
   
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
