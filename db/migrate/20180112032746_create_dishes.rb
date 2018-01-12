class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :user_id
      t.integer :venues_id
      t.integer :category_id

      t.timestamps

    end
  end
end
