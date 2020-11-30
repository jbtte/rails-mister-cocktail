class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  accepts_nested_attributes_for :cocktail

  validates :description, :cocktail_id, :ingredient_id, presence: true
  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id]

end
