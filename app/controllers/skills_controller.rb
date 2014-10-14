class SkillsController < ApplicationController

  def destroy
    @matrix = CompetenciesMatrix.find(params[:competencies_matrix_id])
    @skill = ValuesSet.find params[:id]
    @skill.destroy

    redirect_to @matrix
  end

  def create
    @matrix = CompetenciesMatrix.find(params[:competencies_matrix_id])
    @skill = Skill.new(skill_params)
    @matrix.skills.append @skill

    @matrix.save
    redirect_to @matrix
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :skill)
  end
end