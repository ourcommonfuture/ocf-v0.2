class UniqueTitle < ActiveRecord::Migration
  def change
  	add_index :courses, :name, :unique => true
  end
end
