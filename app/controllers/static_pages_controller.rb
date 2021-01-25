class StaticPagesController < ApplicationController
  def home
    @alumnus = Tag.find(6).posts.limit(4)
    @lessons = Tag.find(5).posts.limit(1)
    @about = Tag.find(3).posts.limit(1)
    @skills  = Tag.find(7).posts.limit(8)
    @teacher = Tag.find(4).posts.limit(6)
  end

  def alumni
    @alumnus = Tag.find(6).posts.page(params[:page]).per(10)
  end
end
