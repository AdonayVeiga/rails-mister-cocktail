class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
end
