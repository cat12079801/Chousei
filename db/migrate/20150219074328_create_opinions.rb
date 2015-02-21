class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :plan_id, null: false
      t.string :cookie, null: false
      t.string :password
      t.string :name, null: false
      t.text :opinion, null: false
      t.text :note

      t.timestamps null: false
    end
  end
end
