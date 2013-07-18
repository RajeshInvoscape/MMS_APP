class ChangeColumnShotNumberToString < ActiveRecord::Migration
  def up
  	change_column :shots, :number, :string
  end

  def down
  	change_column :shots, :number, :integer
  end
end
