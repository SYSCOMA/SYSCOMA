class ValuesSetsController < ApplicationController

  def destroy
    @matrix = CompetenciesMatrix.find(params[:competencies_matrix_id])
    p params[:id]
    p params[:competencies_matrix_id]
    @value = ValuesSet.find params[:id]
    @value.destroy

    redirect_to @matrix
  end

  def create
    @matrix = CompetenciesMatrix.find(params[:competencies_matrix_id])
    @value = ValuesSet.new(value_params)
    @matrix.values_sets.append @value

    @matrix.save
    redirect_to @matrix
  end

  private
  def value_params
    params.require(:values_set).permit(:name, :value)
  end
end