class Dish < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :class_name => "CategoryId"

  belongs_to :venues,
             :class_name => "Venue"

  belongs_to :user

  # Indirect associations

  # Validations

end
