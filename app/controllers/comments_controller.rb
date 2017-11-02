class CommentsController < ApplicationController

  def update
    @comment = Comment.find(params[:id])
    @micropost = Micropost.find(params[:micropost_id])
    if @comment.update(comment_params)
      flash[:success] = "正常に更新されました"
    else
      flash[:danger] = "更新に失敗しました"
    end
    redirect_to @micropost
  end

  def create
    @micropost = Micropost.find(params[:micropost_id])
    if @micropost.comments.build(comment_params).save
      flash[:success] = "コメントしました"
    else
      flash[:danger] = "コメントに失敗しました"
    end
    redirect_to @micropost
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "コメントを削除しました"
    else
      flash[:danger] = "コメントの削除に失敗しました"
    end
    redirect_to @micropost
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
