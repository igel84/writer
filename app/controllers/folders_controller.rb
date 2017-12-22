class FoldersController < ApplicationController
  before_action :find_folder, only: [:edit, :update, :destroy]

  def create
    @folder = Folder.new(folder_params)
    @folder.user = current_user
    @folder.save!
    redirect_to :root
  end

  def edit
    unless @folder.user == current_user
      redirect_to :root, status: 403, :notice => "You don't have rights to access this page"
    else
      render 'edit'
    end
  end


  def update
    @folder.update(folder_params)
    redirect_to @folder, :notice => "Success!"
  end

  def destroy
    unless @folder.user == current_user
      redirect_to :root, status: 403, :notice => "Access is denied"
    else
      @folder.destroy
      redirect_to :root, :notice => "Success!"
    end
  end

  private

  def find_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :tags, :parent_id)
  end
end
