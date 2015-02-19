class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.int :plan_id
      t.string :cookie
      t.string :password
      t.string :name
      t.text :opinion
      t.text :note

      t.timestamps null: false
    end
  end
end
