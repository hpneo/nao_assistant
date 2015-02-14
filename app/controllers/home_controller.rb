class HomeController < ApplicationController
  def index
    if cookies.signed[:current_user_id].blank?
      redirect_to login_path
    else
      @user = User.find(cookies.signed[:current_user_id])
    end
  end

  def login
  end

  def process_login
    name = params[:name]

    if user = User.where('name LIKE ?', "%#{name}%").first
      cookies.signed[:current_user_id] = user.id

      redirect_to root_path
    else
      redirect_to login_path, flash: 'Usuario no encontrado'
    end
  end
end
