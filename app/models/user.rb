# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  admin           :boolean          default(FALSE)
#  email           :string
#  name            :string
#  password_digest :string
#  remember_digest :string
#  reset_digest    :string
#  reset_sent_at   :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    attr_accessor :remember_token, :reset_token
    before_save { email.downcase! }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end
    

    def forget
        update_attribute(:remember_digest, nil)
    end

    def create_reset_digest
        self.reset_token = User.new_token
        update_columns(reset_digest:  User.digest(reset_token), reset_sent_at: Time.zone.now)
    end

    # パスワードリセットメール
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    # ユーザー作成時、パスワードリセット専用メール
    def send_password_reset_email_create
        UserMailer.create_user(self).deliver_now
    end

    #ユーザー情報更新時のメール
    def send_user_edit
        UserMailer.edit_user(self).deliver_now
    end

    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end

    def self.guest
        find_or_create_by!(name: 'guset', email: 'guest@example.com') do |user|
            user.password_digest = SecureRandom.urlsafe_base64
        end
    end

    private

    def downcase_email
      self.email = email.downcase
    end
end
