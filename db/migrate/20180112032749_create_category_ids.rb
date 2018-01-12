class CreateCategoryIds < ActiveRecord::Migration
  def change
    create_table :category_ids do |t|
      t.string :name
      t.string :cuisine

      t.timestamps

    end
  end
end
