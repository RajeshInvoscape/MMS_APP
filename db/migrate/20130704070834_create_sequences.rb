class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
