# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  email      :string
#  kinds      :string
#  message    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class InquiryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
