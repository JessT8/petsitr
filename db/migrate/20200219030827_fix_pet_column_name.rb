class FixPetColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :type, :animal
  end
end