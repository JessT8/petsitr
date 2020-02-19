class PetsSitters < ActiveRecord::Migration[5.2]
  def change
    create_table :pets_sitters do |t|
      t.references :pet
      t.references :sitter
      t.timestamps
    end
  end
end