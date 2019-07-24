class Chef < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
