class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :number
      t.integer :duration
      t.string :description
      t.date :deliverydate
      t.integer :sequence_id

      t.timestamps
    end
  end
end
