class Shot < ActiveRecord::Base

  belongs_to :sequence
  has_many :shot_users,  dependent: :destroy
  has_many :users, through: :shot_users 
  
  has_many :roto_users , class_name: "User", conditions: "users.expertise = 'Roto'", through: :shot_users, source: :user
  has_many :paint_users, class_name: "User", conditions: "users.expertise = 'Paint'", through: :shot_users, source: :user
  has_many :comp_users, class_name: "User", conditions: "users.expertise = 'Comp'", through: :shot_users, source: :user

  attr_accessible :deliverydate, :description, :duration, :number, :sequence_id, :status
   
  VALID_REGEX = /[a-zA-Z]{3}\_+[0-9]{3}/
  validates :number, presence: true,format: { with: VALID_REGEX }
  validates :sequence_id, presence: true
  validates :description, presence: true, length: { maximum: 140}
  validates :deliverydate, presence: true
  validates :duration, presence: true
  validates :status, presence: true
  validates_uniqueness_of :number, :scope => [:sequence_id]


  validate :comp_user_validating, on: :create

  def comp_user_validating
    error.add(:user_id, "don't select more than one user") if self.comp_users.length == 1 
  end
  def assigned_users
    (self.roto_users + self.paint_users + self.comp_users).compact
  end
  def assigned_user_names
    assigned_users.collect(&:username).join(", ")
  end

  def self.search(search)
    search_condition = "%" + search 
    self.where('number LIKE ? ', search_condition)
  end

end
