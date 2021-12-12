class ApplicationController < ActionController::Base
#before_action を使って、Applicationコントローラーが読み込まれた最初に、configure_permitted_parametersメソッドを読むかどうか判断する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

#サインアップ時にnameカラムとgenderカラムを保存できるように許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction])
  end

end
