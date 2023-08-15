class Category < ApplicationRecord
  belongs_to :user
  has_many :operation_categories, dependent: :destroy
  has_many :operations, through: :operation_categories

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
