class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.integer :club_id
      t.string :theme
      t.string :info

      t.timestamps
    end
  end
end
