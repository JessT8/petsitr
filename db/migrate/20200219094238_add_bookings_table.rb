class AddBookingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
        t.references :sitter, foreign_key: true
        t.references :user, foreign_key: true
        t.date :start_date
        t.date :end_date
        t.boolean :status
        t.timestamps
    end
  end
end
