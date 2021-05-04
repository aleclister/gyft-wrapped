class Relation < ApplicationRecord
  has_many :taggings
  has_many :hobbies, through: :taggings
  serialize :hobby_ids, Array

  def self.tagged_with(name)
    Hobby.find_by!(name: name).relations
  end

  def self.tag_counts
    Hobby.select('hobbies.*, count(taggings.hobbies_id) as count').joins(:taggings).group('taggings.hobbies_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Hobby.where(name: n.strip).first_or_create!
    end
  end
end
