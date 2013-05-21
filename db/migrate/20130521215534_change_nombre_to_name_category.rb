class ChangeNombreToNameCategory < ActiveRecord::Migration
  def change
    rename_column :categories ,:nombre,:name
  end
end
