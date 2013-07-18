class AddStatusToShots < ActiveRecord::Migration
  def change
    add_column :shots, :status, :string
  end
end
