class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]

  layout :layout_by_resource

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :profile_picture, :email, :password, :password_confirmation) }
    end

    def layout_by_resource
      if devise_controller? && action_name == 'new'
        "devise"
      end
      if !devise_controller? && action_name == 'edit' || action_name == 'update'
        "application"
      end
    end
end
