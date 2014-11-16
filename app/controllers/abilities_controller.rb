class AbilitiesController < ApplicationController
  before_action :set_ability
  before_action :authenticate_user!
  before_action :authenticate_admin_user

  def edit
    @ability.values.build
  end

  def update
    if params[:commit] == "Update Ability"
      if @ability.update(ability_params)
        redirect_to competence_matrix_path(@ability.competence_matrix)
      else
        render "edit"
      end
    else
      @ability.assign_attributes(ability_params)
      @ability.values.build
      render "edit"
    end
  end

  private
    def set_ability
      @ability = Ability.find(params[:id])
    end

    def ability_params
      params.require(:ability).permit(:name, :competence_matrix,
          values_attributes: [:id, :value, :rank, :_destroy])
    end
    
    def authenticate_admin_user
      if !user_signed_in? || !current_user.admin?
        redirect_to competence_matrix_path Ability.find(params[:id]).competence_matrix
      end
    end
end
