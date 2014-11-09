class CompetenceMatricesController < ApplicationController
  before_action :set_competence_matrix, only: [:show, :edit, :update, :destroy]

  def index
    @competence_matrices = CompetenceMatrix.all
    respond_with(@competence_matrices)
  end

  def show
    respond_with(@competence_matrix)
  end

  def new
    @competence_matrix = CompetenceMatrix.new
    respond_with(@competence_matrix)
  end

  def edit
  end

  def create
    @competence_matrix = CompetenceMatrix.new(competence_matrix_params)
    @competence_matrix.save
    respond_with(@competence_matrix)
  end

  def update
    @competence_matrix.update(competence_matrix_params)
    respond_with(@competence_matrix)
  end

  def destroy
    @competence_matrix.destroy
    respond_with(@competence_matrix)
  end

  private
    def set_competence_matrix
      @competence_matrix = CompetenceMatrix.find(params[:id])
    end

    def competence_matrix_params
      params.require(:competence_matrix).permit(:name)
    end
end
