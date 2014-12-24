class Character < ActiveRecord::Base

  has_one :character_stats
  has_one :race
  has_one :character_class

  has_many :items, as: :owner

end
