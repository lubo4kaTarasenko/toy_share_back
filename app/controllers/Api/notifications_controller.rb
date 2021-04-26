class Api::NotificationsController < ActionController::API

  def index
    notifications = current_user.notifications
    render json: { notifications: notifications}
  end

  def update
    current_user.notifications.update_all(status: 'viewed')
    render json: { success: true}
  end

end