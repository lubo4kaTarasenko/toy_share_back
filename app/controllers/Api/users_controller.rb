class Api::UsersController < ActionController::API

  def update
    user_params = JSON.parse(params[:user])
    name = "#{user_params['name']} #{user_params['soname']}"
    current_user.update(name: name)
  end

  def show
    user = {
      name: current_user.name
    }
    render json: {user: user)}
  end
end