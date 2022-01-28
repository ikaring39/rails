class UserController < ApplicationController
  # DBにデータを追加
  def user_create
    Post.create(:uuid => params[:uuid], :content => params[:content])
    redirect_to("/posts")
  end
  # DBからデータを削除
  def user_delete
    @task = Post.find(params[:id])
    @task.destroy
    redirect_to("/posts")
  end
end