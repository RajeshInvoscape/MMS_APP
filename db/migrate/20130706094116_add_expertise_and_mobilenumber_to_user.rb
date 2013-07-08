class AddExpertiseAndMobilenumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :expertise, :string
    add_column :users, :mobilenumber, :decimal, :precision => 12 , :scale => 0
  end
end
