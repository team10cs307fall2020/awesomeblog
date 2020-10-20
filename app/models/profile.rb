class Profile < ApplicationRecord
  belongs_to :user
  validates :Phone, numericality: {only_integer: true}, length: { maximum: 10, minimum: 10 }
  validates :Bio, length: { maximum: 100 }
end
