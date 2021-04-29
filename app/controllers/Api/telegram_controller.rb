class Api::TelegramController < ActionController::API

  def telegram_webhook
    user = User.find_by(email: params[:email])
    user.update(telegram_chat_id: params[:chat_id]) if user.exists?
    render json: {success: true}
  end

end