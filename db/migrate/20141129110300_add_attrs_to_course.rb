class AddAttrsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :price, :integer
    add_column :courses, :paylink, :string
    add_column :courses, :status, :string
  end
end
