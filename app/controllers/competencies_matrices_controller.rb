class CompetenciesMatricesController < ApplicationController
  def new
    @matrix = CompetenciesMatrix.new
  end

  def create
    @matrix = CompetenciesMatrix.new(matrix_params)
    @matrix.reference_matrix = true

    if @matrix.save
      redirect_to @matrix
    else 
      render 'new'
    end
  end

  def show
    @matrix = CompetenciesMatrix.find(params[:id])
    @value = ValuesSet.new
  end

  def index
    @matrices = CompetenciesMatrix.where reference_matrix: true
  end

  def edit
    @matrix = CompetenciesMatrix.find(params[:id])
  end

  def update
    @matrix = CompetenciesMatrix.find(params[:id])
 
    if @matrix.update(matrix_params)
      redirect_to @matrix
    else
      render 'edit'
    end
  end

  def destroy
    @matrix = CompetenciesMatrix.find(params[:id])
    @matrix.destroy

    redirect_to competencies_matrices_path
  end

  private
  def matrix_params
    params.require(:competencies_matrix).permit(:name, :short_description, :description)
  end
end
