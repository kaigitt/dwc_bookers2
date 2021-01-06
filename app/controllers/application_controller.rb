class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!,except: [:top, :about]
  before_action :set_current_user

  def after_sign_in_path_for(resource)
    user_path(current_user.id) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    "/" # ログアウト後に遷移するpathを設定
  end

  def after_sign_up_path_for(resource)
    user_path(current_user.id) # サインアップに遷移するpathを設定
  end


  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def ensure_correct_user
    @book = Book.find_by(id:params[:id])
    if @book.user_id != @current_user.id
      redirect_to("/books/index")
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [
     :email,
     :name,
     :post_code,
     :prefecture_name,
     :address_city,
     :address_street,
    :address_building
   ])
  end
end
