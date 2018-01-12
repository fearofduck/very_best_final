class CategoryId < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :foreign_key => "category_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
