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
#  lead             :string
#  learning         :text
#  memories         :text
#  name             :string
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
#  tag_id           :integer
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
  belongs_to :tag
  has_many :tags,dependent: :destroy
  has_many_attached :images
  # has_rich_text :content
  default_scope -> { order(created_at: :desc) }
  validates :images,   content_type: { in: %w[image/jpeg image/gif image/png],
    message: "の拡張子はPNG,JPEG,GIFのいずれかのみです。" },
size:         { less_than: 5.megabytes,
    message: "ファイルは5MB未満にしてください。" }
  # validates :tags,presence: true  
end
