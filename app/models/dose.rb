class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, :ingredient, :cocktail, presence: true
  validates :cocktail, uniqueness: { case_sensitive: false, scope: :ingredient }
end
