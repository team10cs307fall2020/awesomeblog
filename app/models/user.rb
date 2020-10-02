
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
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, presence: true, dependent: :destroy
  validates :password, presence: true, password:true
  validates :password, confirmation: true
  validates :username, presence: true
  validates :email, presence:true, email:true
end
