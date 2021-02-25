class Api::ProductsController < ActionController::API
  def create
    json = params.require(:product).permit(:name, :description, :kind).to_h
    json.merge!(user_id: current_user.id)
    #Product.create(json)
  end
end
