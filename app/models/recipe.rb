# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food

  validates :name, presence: true
  validates :description, presence: true
  validates :cooking_time, presence: true
  validates :preparation_time, presence: true
end