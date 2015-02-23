class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :cookie, null: false
      t.string :password
      t.string :title, null: false
      t.text :explanation
      t.string :hash, null: false
      t.date :day_start, null: false
      t.date :day_end, null: false
      t.text :day_out
      t.integer :day_number, null: false
      t.boolean :enable_time, null: false
      t.time :time_start
      t.time :time_end

      t.timestamps null: false
    end
  end
end
