class ApplicationController < ActionController::API
  include ActionController::Cookies


rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable


private

def render_unprocessable(exception)
  render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
end

def authorize
  @current_user = User.find_by(id: session[:user_id])

  render json: { error: ["Not authorized", "This isn't authorized"] }, status: :unauthorized unless @current_user
end

end
