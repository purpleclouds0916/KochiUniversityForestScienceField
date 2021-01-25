# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  birthplace       :string
#  content          :text
#  external_url     :text
#  job              :string
#  job_description  :text
#  learning         :text
#  memories         :text
#  name             :string
#  occupation       :string
#  original_content :text
#  original_title   :string
#  reason           :text
#  research_field   :string
#  research_office  :string
#  teacher_url      :text
#  title            :string
#  url_references   :string
#  video_url        :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_posts_on_user_id                 (user_id)
#  index_posts_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
