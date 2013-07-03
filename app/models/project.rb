class Project < ActiveRecord::Base
  attr_accessible :projectname
  validates :projectname, presence: true, length: { maximum: 50 }, uniqueness: true
end
