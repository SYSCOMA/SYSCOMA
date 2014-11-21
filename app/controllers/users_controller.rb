class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_matrix, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:index, :create, :new, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @competence_matrices = user_matrices
  end

  def show_matrix
    @competence_matrix = CompetenceMatrix.find(params[:matrix_id])
    @abilities = @competence_matrix.abilities.sort_by { |ability| ability.name }
    set_competences
    filter_filled_knowledge_areas
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else 
      render "new"
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def authenticate_admin
      if !current_user.admin?
        redirect_to root_path
      end
    end

    def user_matrices
      competences = (Competence.where user: @user).to_a
      competences.uniq! { |competence| competence.competence_matrix_id }
      competences.collect! { |competence| competence.ability.competence_matrix }
    end

    def filter_filled_knowledge_areas
      @knowledge_areas = @competences.uniq { |competence| competence.knowledge_area.id }
      @knowledge_areas.collect! { |competence| competence.knowledge_area }
      @knowledge_areas.sort_by! { |knowledge_area| knowledge_area.name }
    end

    def set_competences
      @competences = (Competence.where user: @user).to_a

      #competence.competence_matrix should through a "through relationship"
      @competences.select! { |competence| competence.ability.competence_matrix_id == @competence_matrix.id }

      @competences.sort_by! { |competence| competence.ability.name }
    end
end