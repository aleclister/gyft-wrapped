class Relation < ApplicationRecord
  belongs_to :user

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

  def next_birthday
    year = Date.today.year
    mmdd = Date.parse(date_of_birth).strftime("%m %d")
    year += 1 if mmdd < Date.today.strftime("%m%d")
    mmdd = '0301' if mmdd == '0229' && !Date.parse("#{year}0101").leap?
    return Date.parse("#{year}#{mmdd}")
  end


  def self.upcoming_birthdays
    Relation.where(date_of_birth: 0.days.ago .. 60.days.from_now)
  end 


  def age
      now = Time.now.utc.to_date
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

end
