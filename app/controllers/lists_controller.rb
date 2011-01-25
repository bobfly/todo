class ListsController < ApplicationController
  before_filter :require_user

  def index
    if current_user.admin?
      @lists = List.where(:user_id => current_user.id )
    else
    @lists = List.where(:assigned_to => current_user.id)
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    @list.user_id = current_user.id
    if @list.save
      flash[:notice] = "Successfully created list."
      redirect_to @list
    else
      render :action => 'new'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "Successfully updated list."
      redirect_to list_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "Successfully destroyed list."
    redirect_to lists_url
  end
end
