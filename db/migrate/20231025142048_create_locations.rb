# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :lng
      t.string :name, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
