class Recipe < ApplicationRecord
  validates :title, :image, :description, presence: true

  belongs_to :chef, optional: true
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :tags, reject_if: proc { |tag| tag['name'].blank? }
  accepts_nested_attributes_for :chef, reject_if: proc { |tag| tag['name'].blank? }
end
