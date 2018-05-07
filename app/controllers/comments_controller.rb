class CommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.comments.new(comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_images_path(post_image)
  end
  def destroy
  end
  def comment_params
    params.require(:comment).permit(:user_id, :post_image_id, :comment)
  end
end
