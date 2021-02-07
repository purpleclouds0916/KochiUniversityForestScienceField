# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
class Url < ApplicationRecord
    belongs_to :post, optional: true
end
