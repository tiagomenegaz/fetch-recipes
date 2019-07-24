class Chef < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_and_belongs_to_many :recipes
end
