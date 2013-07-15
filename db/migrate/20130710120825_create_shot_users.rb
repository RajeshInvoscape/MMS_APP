class CreateShotUsers < ActiveRecord::Migration
  def change
    create_table :shot_users do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :shot, :null => false
      t.timestamps
    end
  end
end
