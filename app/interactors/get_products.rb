class GetProducts
  include Interactor

  def call
    scp = get_list.order(updated_at: :desc)
    context.products = scp.page(context.params[:p]).per(20).map do |product|
      product.attributes.merge(
        category: product.category.name,
        subcategory: product.subcategory.name
      )
    end

    context.pages_count = (scp.count.to_f / 20).ceil
  end

  private

  def get_list
    params = context.params
    scp = Product.search(params[:q]).includes(:category).includes(:subcategory)

    if params[:sc].present? && params[:sc] != 'undefined'
      scp = scp.where(subcategory_id: Subcategory.find_by(name: params[:sc]).id)
    elsif params[:c].present? && params[:c] != 'undefined'
      scp = scp.where(category_id: params[:c].to_i)
    end
    scp
  end
end