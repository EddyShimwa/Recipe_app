class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, source: :food

  def food_quantities_by_name
    recipe_foods.joins(:food).group('foods.name').sum(:quantity)
  end

  def food_count
    foods.count
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :cooking_time, presence: true
  validates :preparation_time, presence: true
end
