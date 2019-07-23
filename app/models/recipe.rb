class Recipe < ApplicationRecord
  validates :title, :image, :description, :chef_name, presence: true

  belongs_to :tag
end
