class Shot < ActiveRecord::Base

  belongs_to :sequence
  has_many :shot_users,  dependent: :destroy
  has_many :users, through: :shot_users 
  
  has_many :roto_users , class_name: "User", conditions: "users.expertise = 'Roto'", through: :shot_users, source: :user
  has_many :paint_users, class_name: "User", conditions: "users.expertise = 'Paint'", through: :shot_users, source: :user

  attr_accessible :deliverydate, :description, :duration, :number, :sequence_id

  validates :number, presence: true
  validates :sequence_id, presence: true
  validates :description, presence: true, length: { maximum: 140}
  validates :deliverydate, presence: true
  validates :duration, presence: true
  validates_uniqueness_of :number, :scope => [:sequence_id]

end
