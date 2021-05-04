class Hobby < ApplicationRecord
  has_many :taggings
  has_many :relations, through: :taggings
end
