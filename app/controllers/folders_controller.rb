class FoldersController < ApplicationController
  def show
    @folder = Folder.find(params[:id])
    unless @folder.user == current_user
      redirect_to :root, status: 403, :notice => "You don't have rights to access this page"
    else
      render 'show'
    end
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.user = current_user
    @folder.save!
    redirect_to :root
  end

  def update
    @folder = Folder.find(params[:id])
    @folder.update(folder_params)
    redirect_to @folder, :notice => "Success!"
  end

  def destroy
  end

  def folder_params
    params.require(:folder).permit(:name, :tags, :parent_id)
  end
end
