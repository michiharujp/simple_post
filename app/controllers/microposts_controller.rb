class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def show
    @debug = Comment.all
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.build
    @comments = @micropost.comments.includes(:micropost)
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      flash[:success] = "正常に投稿されました"
    else
      flash[:danger]  = "投稿に失敗しました"
    end
    redirect_to root_path
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "正常に編集されました"
    else
      flash[:danger]  = "編集に失敗しました"
    end
    redirect_to @micropost
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    if @micropost.destroy
      flash[:success] = "正常に削除されました"
    else
      flash[:danger] = "削除に失敗しました"
    end
    redirect_to root_path
  end

  private
    def micropost_params
      params.require(:micropost).permit(:title, :content)
    end

end
