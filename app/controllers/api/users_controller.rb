class Api::UsersController < ActionController::API
  def update
    user_params = JSON.parse(params[:user])
    name = "#{user_params['name']} #{user_params['soname']}"
    user_params = { name: name }

    if params['avatar'] && params['avatar'] != 'undefined'
      uploaded_avatar = Cloudinary::Uploader.upload(params['avatar'].path)
      user_params[:avatar] = uploaded_avatar['url']
    end

    current_user.update(user_params)
    render_user
  end

  def show
    render_user
  end

  def render_user
    user = {
      name: current_user.name,
      avatar: current_user.avatar
    }
    render json: { user: user }
  end

  def user_profile
    user = User.find_by(email: params[:email])
    user_params = {
      name: user.name,
      avatar: user.avatar,
      email: user.email
    }
    render json: { user: user_params }
  end
end
