class CompetenceMatricesController < ApplicationController
  before_action :set_competence_matrix, only: [:show, :edit, :update, :destroy]
  before_action :set_secondary_competence_matrix, only: [:users, :destroy_value, :destroy_knowledge_area, :destroy_ability]
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
    if params[:commit] == "Create Competence matrix"
      if @competence_matrix.save
        redirect_to competence_matrix_path(@competence_matrix)
      else 
        render "new"
      end
    else
      handle_commit
      render "new"
    end
  end

  def update
    if params[:commit] == "Update Competence matrix"
      if @competence_matrix.update(competence_matrix_params)
        redirect_to competence_matrix_path(@competence_matrix)
      else
        render "edit"
      end
    else
      @competence_matrix.assign_attributes(competence_matrix_params)
      handle_commit
      render "edit"
    end
  end

  def destroy
    @competence_matrix.destroy
    redirect_to competence_matrices_path
  end

  def users
    if params.key? :ability_id
      @ability = Ability.find(params[:ability_id])
      if params.key? :id
        @value = Value.find(params[:id])
        set_users @value
        render 'competence_matrix_ability_value_users'
      else
        set_users @ability
        render 'competence_matrix_ability_users'
      end
    elsif params.key? :knowledge_area_id
      @knowledge_area = KnowledgeArea.find(params[:knowledge_area_id])
      set_users @knowledge_area
      render 'competence_matrix_knowledge_area_users'
    elsif params.key? :value_id
      @value = Value.find(params[:value_id])
      set_users @value
      render 'competence_matrix_value_users'
    else
      set_users @competence_matrix
      render 'competence_matrix_users'
    end
  end

  def destroy_knowledge_area
    knowledge_area = KnowledgeArea.find(params[:id])
    knowledge_area.destroy
    redirct_to @competence_matrix
  end

  def destroy_ability
    ability = Ability.find(params[:id])
    ability.destroy
    redirct_to @competence_matrix
  end

  def destroy_value
    value = Value.find(params[:id])
    value.destroy
    if params.key? :ability_id
      ability = Ability.find(params[:ability_id])
      redirect_to edit_competence_matrix_ability_path(@competence_matrix, ability)
    else
      redirct_to @competence_matrix
    end
  end

  private
    def set_competence_matrix
      @competence_matrix = CompetenceMatrix.find(params[:id])
    end

    def set_secondary_competence_matrix
      @competence_matrix = CompetenceMatrix.find(params[:competence_matrix_id])
    end

    def competence_matrix_params
      params.require(:competence_matrix).permit(:name, 
              abilities_attributes: [:id, :name, :_destroy],
              knowledge_areas_attributes: [:id, :name, :_destroy],
              values_attributes: [:id, :value, :rank, :_destroy])
    end
    
    def authenticate_admin_user
      if !user_signed_in? || !current_user.admin?
        redirect_to welcome_index_path 
      end
    end

    def handle_commit
      if params[:commit] == "Add ability"
        @competence_matrix.abilities.build
      elsif params[:commit] == "Add knowledge area"
        @competence_matrix.knowledge_areas.build
      else
        @competence_matrix.values.build
      end
    end

    def set_users object
      @users = object.competences.collect { |competence| competence.user }
      @users.uniq!
    end
end