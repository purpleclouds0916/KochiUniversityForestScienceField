class StaticPagesController < ApplicationController
    #すでに公開しているので、ログイン制限。実際は削除↓
    before_action :logged_in_user
  def home
    @alumnus = Tag.find(6).posts.limit(4)
    @lessons = Tag.find(5).posts.limit(1)
    @meaning = Tag.find(2).posts.limit(3)
    @about = Tag.find(3).posts.limit(1)
    @skills  = Tag.find(7).posts.limit(8)
    @teacher = Tag.find(4).posts.limit(6)
    @teacher_video = Tag.find(8).posts
  end

  def alumni
    @alumnus = Tag.find(6).posts.page(params[:page]).per(10)
  end
end
