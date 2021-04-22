class Api::CommentsController < ActionController::API

  def index
    notifications = current_user.notificatios
    render json: { notifications: notifications}
  end

  def update
    json = params.require(:notification).permit(:id)
    notification = Notification.find(json[:id])
    notification.update(status: 'viewed')
  end

  def destroy
    Notification.destroy(params[:id]) if Notification.find(params[:id]).user_id == current_user.id
  end
end