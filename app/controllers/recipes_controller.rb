class RecipesController < ApplicationController
  before_action :authorize


  # GET /recipes
  def index
    render json: Recipe.all
  end

  # POST /recipes
  def create
    recipe = @current_user.recipes.create!(recipe_params)
    render json: recipe, status: :created
  end


  private

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.permit(:id, :title, :instructions, :minutes_to_complete, :password, :password_confirmation, :user)
    end



end
