class CompetenceMatricesController < ApplicationController
  before_action :set_competence_matrix, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin_user

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
    
    def authenticate_admin_user
      if !user_signed_in? || !current_user.admin?
        redirect_to welcome_index_path 
      end
    end
end
