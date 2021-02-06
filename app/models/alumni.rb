# == Schema Information
#
# Table name: alumnis
#
#  id               :integer          not null, primary key
#  birthplace       :string
#  job              :string
#  job_description  :string
#  learning         :text
#  memories         :text
#  name             :string
#  original_content :text
#  original_title   :string
#  reason           :text
#  research_field   :string
#  research_office  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  post_id          :integer
#
class Alumni < ApplicationRecord
    belongs_to :post
end
