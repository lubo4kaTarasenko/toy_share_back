class CreateProduct
  include Interactor

  def call
    params = context.params
    uploaded_pictures = params[:data].values.map { |v| Cloudinary::Uploader.upload(v.path) } if params[:data]

    product = JSON.parse(params[:product])
    category = Category.find_by(name: product['category'])
    subcategory = Subcategory.find_by(category: category, name: product['subcategory'])
    product_new = Product.create!(
      name: product['name'],
      description: product['description'],
      kind: product['kind'],
      user: context.user,
      category: category,
      subcategory: subcategory,
      status: 'unpublished'
    )
    uploaded_pictures.each { |picture| product_new.images.create(url: picture['url']) } if uploaded_pictures
  end
end
