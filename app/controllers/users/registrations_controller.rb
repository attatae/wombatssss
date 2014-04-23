class Users::RegistrationsController < Devise::RegistrationsController

  def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :profile_name, :email, :email_confirmation, :password, :remember_me)
  end
end