class UserController < ApplicationController
  # DBにデータを追加
  def regist
    Post.create(:uuid => params[:uuid], :content => params[:content])
    redirect_to("/posts")
  end
  # DBからデータを削除
  def destroy
    data = Post.find(params[:id])
    data.destroy
    redirect_to("/posts")
  end
end