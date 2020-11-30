class Ingredient < ApplicationRecord
  before_destroy :used_ingredient?

  has_many :doses
  validates :name, presence: true, uniqueness: true

  private

  def used_ingredient?
    !Dose.where( :ingredient_id == self ).exists?
  end
end
