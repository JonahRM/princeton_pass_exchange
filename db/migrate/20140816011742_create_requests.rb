class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :quantity

      t.timestamps
    end
  end
end
