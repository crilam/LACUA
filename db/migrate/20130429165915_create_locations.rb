class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :codigo
      t.string :name
      t.string :floor

      t.timestamps
    end
  end
end
