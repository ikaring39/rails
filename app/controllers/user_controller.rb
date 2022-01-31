class UserController < ApplicationController
  # DBにデータを追加
  def user_create
    @post = Post.create(:uuid => params[:uuid], :content => params[:content])
    redirect_to("/posts")
  end
  # DBからデータを削除
  def user_destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to("/posts")
  end
end