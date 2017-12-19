class PostsController < ApplicationController
  before_action :current_folder

  def new
    @post = Post.create(folder: @folder, text: "New post", user: current_user)
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def current_folder
    if params[:folder_id]
      @folder = Folder.find(params[:folder_id])
    elsif params[:id]
      @post = Post.find(params[:id])
      @folder = @post.folder
    end
  end
end
