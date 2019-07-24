class Tag < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
