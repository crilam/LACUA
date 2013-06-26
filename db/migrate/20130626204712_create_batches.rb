class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.float :reference
      t.float :state
      t.float :quality
      t.string :description
      t.references :cloth

      t.timestamps
    end
    add_index :batches, :cloth_id
  end
end
