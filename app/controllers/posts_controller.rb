class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # 新規作成
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # 登録に成功/失敗の結果を表示する
    # 正規表現がおかしいため要修正
    if @post.uuid.match(/\A[ｧ-ﾝﾞﾟ]+\z/) && @post.content.match(/\A[ｧ-ﾝﾞﾟ]+\z/)
      flash[:success] = "ユーザー登録に成功しました！"
    else
      flash[:alert] = "ユーザー登録に失敗しました…"
    end
    redirect_to posts_path
  end

  # 削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  # パラメータ定義
  private
    def post_params
      params.require(:post).permit(:uuid,:content)
    end
end