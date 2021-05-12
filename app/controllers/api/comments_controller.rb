class Api::CommentsController < ActionController::API
  def create
    json = params.require(:comment).permit(:body, :rating, :product_id).to_h
    json.merge!(user_id: current_user.id)
    Comment.create(json)
    product = Product.find(params[:product_id])

    Notification.create(body: "#{current_user.email} прокоментував  Вашу річ #{product.name}", user: product.user,
                        kind: 'comment', status: 'new')
  end

  def update
    json = params.require(:comment).permit(:body, :rating, :id)
    comment = Comment.find(json[:id])
    comment.update(json) if comment.user_id == current_user.id
  end

  def destroy
    Comment.destroy(params[:id]) if Comment.find(params[:id]).user_id == current_user.id
  end
end
