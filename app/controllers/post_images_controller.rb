class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end
  def index
    @post_images = PostImage.all.reverse_order
  end
  def show
    @post_image = PostImage.find(params[:id])
    @comment = Comment.new
  end
  def edit
    @post_image = PostImage.find(params[:id])
  end
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to root_path
  end
  def update
        post_image = PostImage.find(params[:id])
        post_image.update(post_image_params)
        redirect_to post_image_path(post_image.id)
  end
  private
    def post_image_params
        params.require(:post_image).permit(:place, :image, :comment, :user_id)
    end
end
