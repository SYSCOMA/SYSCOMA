class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_group_with_group_id, 
      only: [:remove_employee, :search_employee, :add_employee, 
      :remove_manager, :search_manager, :add_manager]
  before_action :authenticate_user!
  before_action :authenticate_admin_user, only: [:index, :new, :create]
  before_action :authenticate_manager_user, only: [:show, :edit, :update,
      :destroy, :remove_employee, :search_employee, :add_employee, 
      :remove_manager, :search_manager, :add_manager]


  def index
    @groups = Group.all.select { |group| group.subgroup_of.nil? }
  end

  def show
    @subgroups = @group.subgroups
    @users = @group.users
  end

  def new
    @group = Group.new
    @group.subgroup_of_id = params[:group_id].to_i
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else 
      render "new"
    end
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render "edit"
    end
  end

  def destroy
    @group.destroy
    if @group.subgroup_of.nil?
      redirect_to groups_path
    else
      supergroup = @group.subgroup_of
      redirect_to group_path(supergroup)
    end
  end

  def remove_employee
    user = User.find(params[:id])
    user.group=nil
    user.save
    redirect_to group_path(@group)
  end

  def search_employee
    @keyword = params[:user][:name]
    @users = User.where( [ "name LIKE ?", "%#{@keyword.to_s.encode("UTF-8")}%" ] ).
        select { |user| user.group.nil? }

  end

  def add_employee
    user = User.find(params[:id])
    user.group = @group
    user.save
    redirect_to group_path(@group)
  end

  def remove_manager
    @group.manager=nil
    @group.save
    redirect_to group_path(@group)
  end

  def search_manager
    @keyword = params[:user][:name]
    @users = User.where [ "name LIKE ?", "%#{@keyword.to_s.encode("UTF-8")}%" ]
  end

  def add_manager
    user = User.find(params[:id])
    @group.manager = user
    @group.save
    redirect_to group_path(@group)
  end

  private
    def set_group_with_group_id
      @group = Group.find(params[:group_id])
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :manager_id, :subgroup_of_id)
    end
    
    def authenticate_admin_user
      if !current_user.admin?
        redirect_to welcome_index_path 
      end
    end

    def authenticate_manager_user
      if !current_user.admin? && !current_user.manager?(@group)
        #user must be an admin or the manager of the group
        redirect_to welcome_index_path 
      end
    end
end
