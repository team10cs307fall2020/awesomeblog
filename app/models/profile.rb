class Profile < ApplicationRecord
  belongs_to :user
  validates :Name, presence: true
  validates :Bio, length: { maximum: 100 }
end
