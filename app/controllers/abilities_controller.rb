class AbilitiesController < ApplicationController
  before_action :set_ability, only: [:edit]
  before_action :set_secondary_ability, only: [:create, :update]
  before_action :set_competence_matrix
  before_action :authenticate_user!
  before_action :authenticate_admin_user

  def edit
    @ability
    @values = @ability.values
    @new_value = Value.new
    @new_value.ability = @ability
  end

  def update
    value = Value.find(params[:id])
    if params[:commit] == t("helpers.links.destroy", default: "Delete")
      value.destroy
    else
      value.update(value_params)
    end
    @ability.reload
    redirect_to edit_competence_matrix_ability_path(@competence_matrix, @ability)
  end

  def create
    value = Value.new(value_params)
    value.save
    @ability.reload
    redirect_to edit_competence_matrix_ability_path(@competence_matrix, @ability)
  end

  private
    def set_ability
      @ability = Ability.find(params[:id])
    end

    def set_secondary_ability
      @ability = Ability.find(params[:ability_id])
    end

    def set_competence_matrix
      @competence_matrix = CompetenceMatrix.find(params[:competence_matrix_id])
    end

    def value_params
      params.require(:value).permit(:id, :value, :rank, :ability_id)
    end
    
    def authenticate_admin_user
      if !user_signed_in? || !current_user.admin?
        redirect_to competence_matrix_path Ability.find(params[:id]).competence_matrix
      end
    end
end
