class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :title, null: false, default: ''
      t.text :description
      t.datetime :due_date, null: false
      t.timestamps
    end
  end
end
