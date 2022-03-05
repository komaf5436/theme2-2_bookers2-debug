class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except:[:top, :about]
  # 　応用2-6 アプリケーションコントローラーに設定しまうと全コントローラーに適用してしまうため、上記を除外。代わりにbooksとusersに追記
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
    # 応用2-10 ログイン後はログインしたuserのページに飛ばないと行けないのでroot_pathを上記に変更
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
