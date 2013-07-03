class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectname

      t.timestamps
    end
  end
end
