class UsersController < ApplicationController
  before_action :authorize
  skip_before_action :authorize, only: [:create]

  # GET /users/1
  def show
    render json: @current_user
  end

  # POST /users
  def create
    user = User.create!(user_params)
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:id, :username, :image_url, :bio, :password, :password_confirmation)
    end

end
