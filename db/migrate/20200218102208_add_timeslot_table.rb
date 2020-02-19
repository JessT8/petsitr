class AddTimeslotTable < ActiveRecord::Migration[5.2]
    def change
        create_table :timeslots do |t|
            t.references :sitter
            t.date :available_start_date
            t.date :available_end_date
            t.timestamps
        end
    end
end
