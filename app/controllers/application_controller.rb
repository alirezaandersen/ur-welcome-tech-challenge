class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from StandardError, with: :render_error_response

  def render_error_response(error)
    responses = eval(error.message)
    render json: responses[:message], status: responses[:code]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
