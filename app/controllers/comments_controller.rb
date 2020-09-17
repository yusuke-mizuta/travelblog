class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.rate = params[:score]
    if comment.save
      redirect_to blog_path(comment.blog_id), notice: "コメントを投稿しました。"
    else
      @blog = Blog.find(params[:comment][:blog_id])
      @user = @blog.user
      @comment = Comment.new
      if @blog.comments.present?
        @avg = Comment.where(blog_id: params[:comment][:blog_id]).average(:rate).round(1)
      end
      redirect_to blog_path(comment.blog_id)
      flash[:alert] = 'コメントを投稿できませんでした。'
    end
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
