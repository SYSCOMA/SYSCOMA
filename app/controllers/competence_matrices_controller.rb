class CompetenceMatricesController < ApplicationController
  before_action :set_competence_matrix, only: [:show, :edit, :update, :destroy]

  def index
    @competence_matrices = CompetenceMatrix.all
  end

  def show
  end

  def new
    @competence_matrix = CompetenceMatrix.new
  end

  def edit
  end

  def create
    @competence_matrix = CompetenceMatrix.new(competence_matrix_params)
    @competence_matrix.save
    redirect_to competence_matrices_path
  end

  def update
    @competence_matrix.update(competence_matrix_params)
  end

  def destroy
    @competence_matrix.destroy
    redirect_to competence_matrices_path
  end

  private
    def set_competence_matrix
      @competence_matrix = CompetenceMatrix.find(params[:id])
    end

    def competence_matrix_params
      params.require(:competence_matrix).permit(:name)
    end
end
