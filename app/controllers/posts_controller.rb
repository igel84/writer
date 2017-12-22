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
    if @post && @post.user == current_user
      @post.update(post_params)
      redirect_to edit_post_path(@post), :notice => "Success!"
    else
      redirect_to edit_post_path(@post), :notice => "Access is denied!"
    end
  end

  def destroy
    if @post && @post.user == current_user
      @post.destroy
      redirect_to edit_folder_path(@folder), :notice => "Success!"
    else
      redirect_to edit_folder_path(@folder), :notice => "Access is denied!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

  def current_folder
    if params[:folder_id]
      @folder = Folder.find(params[:folder_id])
    elsif params[:id]
      @post = Post.find(params[:id])
      @folder = @post.folder
    end
  end
end
