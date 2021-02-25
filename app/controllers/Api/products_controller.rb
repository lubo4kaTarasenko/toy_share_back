class Api::ProductsController < ActionController::API
  def create
    json = params.require(:product).permit(:name, :description, :kind).to_h
    json.merge!(user_id: current_user.id)
    #Product.create(json)
  end

  def index
    scp = get_list.order(updated_at: :desc)
    products = scp.page(params[:p]).per(20).map do |p|
      p.attributes.merge(
        category: p.category.name,
        subcategory: p.subcategory.name
      )
    end

    pages_count = (scp.count.to_f / 20).ceil

    if current_user
      user = {
        email: current_user.email
      }
    end
    render json: { products: products, pages: pages_count, user: user }
  end

  def show
    product = Product.find_by(url_name: params[:name])

    render json: {
      product: product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name
    )}
  end

  private

  def get_list
    scp = Product.search(params[:q]).includes(:category).includes(:subcategory)

    if params[:sc].present? && params[:sc] != 'undefined'
      scp = scp.where(subcategory_id: Subcategory.find_by(name: params[:sc]).id)
    elsif params[:c].present? && params[:c] != 'undefined'
      scp = scp.where(category_id: params[:c].to_i)
    end
    scp
  end
end
