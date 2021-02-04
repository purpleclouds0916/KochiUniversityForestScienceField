class StaticPagesController < ApplicationController
    #すでに公開しているので、ログイン制限。実際は削除↓
    before_action :logged_in_user
  def home
    @swipers =  Tag.find(1).posts.limit(3)
    @meanings = Tag.find(2).posts.limit(3)
    @about = Tag.find(3).posts.limit(1)
    @teacher = Tag.find(4).posts.limit(6)
    @lessons = Tag.find(5).posts.limit(1)
    # binding.pry
    @alumnus = Tag.find(6).posts.limit(4)
    @skills  = Tag.find(7).posts.limit(8)
    @teacher_video = Tag.find(8).posts.limit(1)
    @external_urls = @meanings.each do |meaning|
       puts meaning.external_url
    end
  end

  def alumni
    binding.pry
    # @alumnus = Post.where(tag_id:6).page(params[:page]).per(10)
    @alumnus = Tag.find(6).posts.page(params[:page]).per(10)
    #  ids = PostTagRelation.where(tag_id: 6).pluck(:post_id)
    #  @alumnus = Post.where(id: ids).page(params[:page]).per(10)
  end
end
