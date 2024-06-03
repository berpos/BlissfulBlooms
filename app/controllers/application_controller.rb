class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    # TODO: ADD THE OTHER PARAMETERS HERE AND MIGRATION
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username garden_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    # TODO: ADD THE OTHER PARAMETERS AND MIGRATION
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username garden_name])
  end
end
