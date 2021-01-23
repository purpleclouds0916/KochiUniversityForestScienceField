class StaticPagesController < ApplicationController
  def home
    @posts = Tag.find(6).posts
  end
end
