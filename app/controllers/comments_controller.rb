class CommentsController < ApplicationController
  before_action :set_micropost
  before_action :set_comment, only: [:update, :destroy]

  def update
    if @comment.update(comment_params)
      flash[:success] = "正常に更新されました"
    else
      flash[:error] = "更新に失敗しました"
    end
    redirect_to @micropost
  end

  def create
    if @micropost.comments.build(comment_params).save
      flash[:success] = "コメントしました"
    else
      flash[:error] = "コメントに失敗しました"
    end
    redirect_to @micropost
  end

  def destroy
    if @comment.destroy
      flash[:success] = "コメントを削除しました"
    else
      flash[:error] = "コメントの削除に失敗しました"
    end
    redirect_to @micropost
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_micropost
      @micropost = Micropost.find(params[:micropost_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

end
