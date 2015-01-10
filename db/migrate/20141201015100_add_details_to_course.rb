class AddDetailsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :details, :text
  end
end
