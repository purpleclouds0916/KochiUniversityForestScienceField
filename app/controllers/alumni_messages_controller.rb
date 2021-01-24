class AlumniMessagesController < ApplicationController
  def alumni
    @post = Post.find(307)
  end
end
