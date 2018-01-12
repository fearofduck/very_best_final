class Venue < ApplicationRecord
  # Direct associations

  has_many   :user_bookmarks,
             :class_name => "Dish",
             :foreign_key => "venues_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :categories,
             :through => :user_bookmarks,
             :source => :category

  # Validations

end
