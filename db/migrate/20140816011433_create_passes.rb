class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :quantity
      t.timestamps
    end
  end
end
