class Shot < ActiveRecord::Base
  attr_accessible :deliverydate, :description, :duration, :number, :sequence_id

  belongs_to :sequence

  validates :number, presence: true, uniqueness: true
  validates :sequence_id, presence: true
  validates :description, presence: true, length: { maximum: 140}
  validates :deliverydate, presence: true
  validates :duration, presence: true
end
