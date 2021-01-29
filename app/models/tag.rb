# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
    has_many :post_tag_relations
    has_many :posts, through: :post_tag_relations
    validates :name,  presence: true
end
