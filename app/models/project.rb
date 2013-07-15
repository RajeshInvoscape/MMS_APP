class Project < ActiveRecord::Base

  has_many :sequences
  
  attr_accessible :projectname
  
  validates :projectname, presence: true, length: { maximum: 50 }, uniqueness: true
 
end
