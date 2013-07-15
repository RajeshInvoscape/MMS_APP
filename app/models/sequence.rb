class Sequence < ActiveRecord::Base
  attr_accessible :name, :project_id

  belongs_to :project
  has_many :shots


  validates :name, presence: true, length: { maximum: 25}
  validates :project_id, presence: true
  validates_uniqueness_of :name, :scope => [:project_id]
end
