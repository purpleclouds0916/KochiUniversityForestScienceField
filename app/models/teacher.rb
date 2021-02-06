# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  job        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
class Teacher < ApplicationRecord
    belongs_to :post
end
