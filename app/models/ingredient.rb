class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :doses
  has_many :cocktails, through: :dose
end
