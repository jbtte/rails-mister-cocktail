class Ingredient < ApplicationRecord
  before_destroy :used_ingredient?

  has_many :doses
  validates :name, presence: true, uniqueness: true
  

  private

  def used_ingredient?
    if Dose.where( :ingredient_id == self ).exists?
      return false
    end
  end
end
