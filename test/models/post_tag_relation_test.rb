# == Schema Information
#
# Table name: post_tag_relations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  tag_id     :integer          not null
#
# Indexes
#
#  index_post_tag_relations_on_post_id  (post_id)
#  index_post_tag_relations_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#  tag_id   (tag_id => tags.id)
#
require 'test_helper'

class PostTagRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
