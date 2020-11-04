class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A(?=.{8,}) (?=.*[[:^alnum:]])/x
      record.errors[attribute] << (options[:message] || "Password is not valid(at least 8 char and one special char)")
    end
  end
end

class User < ApplicationRecord
  before_create :generate_token

  def generate_token
    auth_token = nil
    begin
      auth_token = SecureRandom.urlsafe_base64
      Rails.logger.info "===auth_token==========#{auth_token}"
    end while User.exists?(auth_token:"#{auth_token}")
    self.auth_token = auth_token
  end

  has_many :posts, dependent: :destroy
  #has_many :comments, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_one :profile, dependent: :destroy
  validates :password, presence: true, password:true
  validates :password, confirmation: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence:true, email:true, uniqueness: true
end