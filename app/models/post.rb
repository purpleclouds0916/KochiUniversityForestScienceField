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
  validates :images,   content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
  size:         { less_than: 5.megabytes,
    message: "should be less than 5MB" }
  validates :url, url: true 
  validates :teacher, teacher: true
  validates :alumni, alumni: true 
  validates :images, images: true 

#スタイダーのバリデーション
  with_options if: :seiper? do |swiper|
    swiper.validates :title, presence: true
    swiper.validates :lead, presence: true
  end

#森林を学ぶ意義のバリデーション
  with_options if: :meaning? do |meaning|
    meaning.validates :title, presence: true
    meaning.validates :content, presence: true
  end

  #森林科学領域のバリデーション
  with_options if: :about? do |about|
    about.validates :content, presence: true
  end

  #先生の紹介のバリデーション
  with_options if: :teacher? do |teacher|
    teacher.validates :content, presence: true
  end

  #授業の紹介のバリデーション
  with_options if: :lesson? do |lesson|
    lesson.validates :content, presence: true
  end

  #資格のバリデーション
  with_options if: :skill? do |skill|
    skill.validates :content, presence: true
  end

  private
    def seiper?
      tag_id == 1
    end

    def meaning?
      tag_id == 2
    end

    def about?
      tag_id == 3
    end

    def teacher?
      tag_id == 4
    end

    def lesson?
      tag_id == 5
    end

    def alumni?
      tag_id == 6
    end

    def skill?
      tag_id == 7
    end

    def teacher_movie?
      tag_id == 8
    end
end
