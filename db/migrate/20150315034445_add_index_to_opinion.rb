class AddIndexToOpinion < ActiveRecord::Migration
  def change
    add_index :opinions, :plan_id
  end
end
