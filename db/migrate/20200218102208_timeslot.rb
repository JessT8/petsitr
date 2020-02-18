class Timeslot < ActiveRecord::Migration[5.2]
    def change
        create_table :timeslots do |t|
            t.references :sitter
            t.date :avaible_start_date
            t.date :avaible_end_date
            t.timestamps
        end
    end
end
