class AddOrderToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :order, :int
  end
end
