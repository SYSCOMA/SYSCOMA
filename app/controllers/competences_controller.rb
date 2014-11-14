class CompetencesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :verify_ownership

  def edit_matrix
    @competence_matrices = CompetenceMatrix.all.sort_by { |matrix| matrix.name }
  end

  def edit_knowledge_area
    @competence_matrix = CompetenceMatrix.find(params[:matrix_id])
    @knowledge_areas = @competence_matrix.knowledge_areas.
        sort_by { |knowledge_area| knowledge_area.name }
  end

  def edit
    @competence_matrix = CompetenceMatrix.find(params[:matrix_id])
    @knowledge_area = KnowledgeArea.find(params[:knowledge_area_id])

    set_competences
  end

  def save
    competences_params.each { |competence_params| save_competence competence_params }
    flash[:notice] = "competences updated"  
    redirect_to competences_edit_path(params[:id], params[:matrix_id], params[:knowledge_area_id])
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def verify_ownership
      if current_user != @user && !@user.subordinate?(current_user) && !current_user.admin?
        redirect_to root_path
      end
    end

    def set_competences
      @competences = Competence.where(knowledge_area_id: @knowledge_area.id,
        user_id: @user.id)

      abilities = @competence_matrix.abilities.sort_by { |ability| ability.name }
      filled_abilities = (@competences.collect { |competence| competence.ability }).
          sort_by { |ability| ability.name }
      abilities.select! { |ability| filled_abilities.exclude? ability }

      empty_competences = abilities.collect { |ability| Competence.
          new({ ability: ability,
          knowledge_area: @knowledge_area,
          user: @user,
          value: @none })}
      @competences.concat empty_competences
      @competences = @competences.to_a.sort_by { |competence| competence.ability.name }
    end

    def competences_params
      params.require(:competences)
    end

    def save_competence params
      if params[:id].empty? && params[:value_id] != nil &&
          params[:value_id] != 0 && params[:value_id] != ""
        params = params.permit(:knowledge_area_id, :ability_id, :user_id, :value_id)
        competence = Competence.new(params)
        competence.save
      elsif params[:value_id] == nil
        Competence.find(params[:id]).destroy
      else
        params = params.permit(:id, :knowledge_area_id, :ability_id, :user_id, :value_id)
        #raise params.inspect
        Competence.find(params[:id]).update(params)
      end
    end
end
