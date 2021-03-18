class Api::UsersController < ActionController::API

  def update
    user_params = JSON.parse(params[:user])
    name = "#{user_params['name']} #{user_params['soname']}"
    avatar = params['avatar']
    uploaded_avatar = Cloudinary::Uploader.upload(avatar.path) if params[:avatar]
    current_user.update(name: name, avatar: uploaded_avatar['url'])
  end

  def show
    user = {
      name: current_user.name,
      avatar: current_user.avatar
    }
    render json: {user: user}
  end
end