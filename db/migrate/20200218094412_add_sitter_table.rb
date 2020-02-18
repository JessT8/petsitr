class AddSitterTable < ActiveRecord::Migration[5.2]
  def change
    create_table :sitters do |t|
      t.references :user, foreign_key: true
      t.string :phone
      t.text :location
      t.string :price
      t.text :description
      t.boolean :is_visible
      t.text :picture
      t.timestamps
    end
  end
end
