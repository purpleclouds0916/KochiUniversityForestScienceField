# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  lead       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer
#  user_id    :integer          not null
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
  has_one :alumni
  has_one :teacher
  has_one :skill
  accepts_nested_attributes_for :alumni
  accepts_nested_attributes_for :teacher
  accepts_nested_attributes_for :skill
  has_many :url, dependent: :destroy
  accepts_nested_attributes_for :url, allow_destroy: true
  has_many_attached :images
  # has_rich_text :content
  default_scope -> { order(created_at: :desc) }
# validates :title, presence: true
validates :images,   content_type: { in: %w[image/jpeg image/gif image/png],
  message: "must be a valid image format" },
size:         { less_than: 5.megabytes,
  message: "should be less than 5MB" }



  def paid_with_card?
    tag_id == 1
  end
end
