class Tag < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :recipes
end
