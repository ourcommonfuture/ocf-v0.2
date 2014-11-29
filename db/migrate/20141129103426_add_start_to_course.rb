class AddStartToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :start, :timestamp
    add_column :courses, :end, :timestamp
    add_column :courses, :schedule_notes, :text
  end
end
