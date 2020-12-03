class Profile < ApplicationRecord
  belongs_to :user
  #validates :Name, presence: true
  validates :Phone, length: { maximum: 10, minimum: 10 }, allow_blank: true, numericality: {only_integer: true}
  validates :Bio, length: { maximum: 100 }
  has_one_attached :picture, dependent: :destroy
end
