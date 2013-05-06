class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.string :distintion
      t.string :height
      t.string :widht
      t.string :depth
      t.string :color
      t.string :feston
      t.string :tipo
      t.integer :categoty_id

      t.timestamps
    end
  end
end
