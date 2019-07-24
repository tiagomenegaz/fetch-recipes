class Recipe < ApplicationRecord
  validates :title, :image, :description, presence: true

  belongs_to :chef, optional: true
  has_and_belongs_to_many :tags
end
