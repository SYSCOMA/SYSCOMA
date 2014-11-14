class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def show
    @competence_matrices = user_matrices
  end

  def show_matrix
    @competence_matrix = CompetenceMatrix.find(params[:matrix_id])
    @abilities = @competence_matrix.abilities.sort_by { |ability| ability.name }
    set_competences
    filter_filled_knowledge_areas
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_matrices
      competences = (Competence.where user: @user).to_a
      competences.uniq! { |competence| competence.competence_matrix_id }
      competences.collect! { |competence| competence.ability.competence_matrix }
    end

    def filter_filled_knowledge_areas
      @knowledge_areas = @competences.uniq { |competence| competence.knowledge_area.id }
      @knowledge_areas.collect! { |competence| competence.knowledge_area }
      @knowledge_areas.sort_by! { |knowledge_area| knowledge_area.name }
    end

    def set_competences
      @competences = (Competence.where user: @user).to_a

      #competence.competence_matrix should through a "through relationship"
      @competences.select! { |competence| competence.ability.competence_matrix == @competence_matrix }

      @competences.sort_by! { |competence| competence.ability.name }
    end
end