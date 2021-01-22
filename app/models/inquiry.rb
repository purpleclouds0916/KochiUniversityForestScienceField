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
class Inquiry < ApplicationRecord

    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: true
    validates :message, presence: true         
    
    def receive_contact
        InquiryMailer.received_email(self).deliver_now
    end    
end
