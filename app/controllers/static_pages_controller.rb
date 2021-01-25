class StaticPagesController < ApplicationController
  def home
    @alumnus = Tag.find(6).posts.limit(4)
  end

  def alumni
    @alumnus = Tag.find(6).posts.page(params[:page]).per(10)
  end
end
