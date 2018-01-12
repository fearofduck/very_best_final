class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :neighborhood
      t.string :location
      t.string :name

      t.timestamps

    end
  end
end
