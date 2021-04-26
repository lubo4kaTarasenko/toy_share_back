class Api::NotificationsController < ActionController::API

  def index
    notifications = current_user.notifications.order(created_at: :desc)
    
    render json: { notifications: notifications.map {|notification| notification.attributes.merge(created_date: notification.created_at.strftime('%d-%m-%Y'))}}
  end

  def update
    current_user.notifications.update_all(status: 'viewed')
    render json: { success: true}
  end

end