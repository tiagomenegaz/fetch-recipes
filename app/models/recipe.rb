class Recipe < ApplicationRecord
  validates :title, :image, :description, presence: true

  belongs_to :tag
end
