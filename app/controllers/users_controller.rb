class UsersController < ApplicationController

  def fill_matrices
    @matrices = CompetenciesMatrix.where reference_matrix: true
  end

  def fill_matrix
    @original_matrix = CompetenciesMatrix.find(params[:id])
    @filled_matrix = current_user.user_competencies.where(user: current_user)
        .map( &:competencies_matrix ).select { |matrix| matrix.name==@original_matrix.name }
        .detect { |matrix| matrix.description==@original_matrix.description }
    if @filled_matrices.nil?
      @original_matrix = CompetenciesMatrix.find(params[:id])
      @filled_matrix = @original_matrix.clone
      @values = []
    else
      @values = Value.where competencies_matrix: @filled_matrix
    end
    @sorted_skills = @filled_matrix.skills.sort_by {|skill| skill.name}
    @sorted_areas = @filled_matrix.knowledge_areas.sort_by {|area| area.name}
  end
end