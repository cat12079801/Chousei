class ChangeColumnToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :original_url, :string, null: false, :after => :hash
    remove_column :plans, :hash, :string, null:false
  end
end
