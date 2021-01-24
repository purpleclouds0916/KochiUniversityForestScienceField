# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  birthplace       :string
#  content          :text
#  job              :string
#  job_description  :text
#  learning         :text
#  memories         :text
#  name             :string
#  original_content :text
#  original_title   :string
#  reason           :text
#  research_field   :string
#  research_office  :string
#  title            :string
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
class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations
  has_many_attached :images
  default_scope -> { order(created_at: :desc) }
  validates :title,  presence: true
  validates :images,   content_type: { in: %w[image/jpeg image/gif image/png],
    message: "の拡張子はPNG,JPEG,GIFのいずれかのみです。" },
size:         { less_than: 5.megabytes,
    message: "ファイルは5MB未満にしてください。" }
end
