class UserController < ApplicationController
  # DBにデータを追加
  def user_create
    @board = Post.create(:uuid => params[:uuid], :content => params[:content])
    redirect_to("/posts")
  end
  # DBからデータを削除
  def user_destroy
    @board = Post.find(params[:id])
    @board.destroy
    redirect_to("/posts")
  end
end