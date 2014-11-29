class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.timestamp :start
      t.timestamp :end
      t.text :desc

      t.timestamps
    end
  end
end
