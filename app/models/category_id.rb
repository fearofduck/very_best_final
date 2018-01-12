class CategoryId < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :foreign_key => "category_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :venues,
             :through => :dishes,
             :source => :venues

  # Validations

end
