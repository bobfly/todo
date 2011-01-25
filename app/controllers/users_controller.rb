class UsersController < ApplicationController
  before_filter :admin_user, :only => [:index, :show]

  def index
    @users = User.find_all_by_created_by(current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if current_user
    @user.created_by = current_user.id
    else
      @user.admin = true
      end
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to lists_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to lists_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end

  private
  def admin_user
    unless current_user.admin?
      redirect_to user_edit_path(current_user.id)
    end
  end
end
