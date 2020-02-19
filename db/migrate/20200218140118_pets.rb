class Pets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :type
      t.timestamps
    end
  end
end