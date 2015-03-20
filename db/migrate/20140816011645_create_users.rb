class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :club_id
      t.string :name
      t.boolean :officer

      t.timestamps
    end
  end
end
