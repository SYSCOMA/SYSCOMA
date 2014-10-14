class KnowledgeAreasController < ApplicationController

  def destroy
    @matrix = CompetenciesMatrix.find(params[:competencies_matrix_id])
    @knowledge_area = KnowledgeArea.find params[:id]
    @knowledge_area.destroy

    redirect_to @matrix
  end

  def create
    @matrix = CompetenciesMatrix.find(params[:competencies_matrix_id])
    @knowledge_area = KnowledgeArea.new(knowledge_area_params)
    @matrix.knowledge_areas.append @knowledge_area

    @matrix.save
    redirect_to @matrix
  end

  private
  def knowledge_area_params
    params.require(:knowledge_area).permit(:name, :knowledge_area)
  end
end