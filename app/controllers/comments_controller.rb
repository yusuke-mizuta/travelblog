class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.rate = params[:score]
    comment.save
    redirect_to blog_path(comment.blog_id), notice: "コメントを投稿しました。"
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to blog_path(comment.blog_id), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :blog_id, :rate)
  end
end
