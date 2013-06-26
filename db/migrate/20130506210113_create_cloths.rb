class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.string :distintion
      t.string :height
      t.string :width
      t.string :depth
      t.string :color
      t.string :feston
      t.string :tipo
      t.integer :category_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
