class Profile < ApplicationRecord
  validates :Name, presence: true
  validates :Bio, length: { maximum: 100 }
end
