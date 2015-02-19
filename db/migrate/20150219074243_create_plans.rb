class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :cookie
      t.string :password
      t.string :title
      t.text :explanation
      t.string :hash
      t.date :day_start
      t.date :day_end
      t.text :day_out
      t.int :day_number
      t.boolean :enable_time
      t.time :time_start
      t.time :time_end

      t.timestamps null: false
    end
  end
end
