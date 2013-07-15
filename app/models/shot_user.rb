class ShotUser < ActiveRecord::Base
  attr_accessible :user_id, :shot_id

  belongs_to :shot 
  belongs_to :user
  
end
