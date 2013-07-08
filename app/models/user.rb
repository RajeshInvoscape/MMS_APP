class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :mobilenumber, :expertise, :admin

  has_many :sequences, :through => :sequnce_users
   
  validates :username, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :mobilenumber, presence: true, length: { minimum: 10 }, uniqueness: true
  validates :expertise, presence: true, inclusion: { in: %w(Roto Paint Comp) }

  def self.roto_users
     @users =	User.where(:expertise => 'Roto')
  end

  def self.paint_users
     @users = User.where(:expertise => 'Paint')
  end
  
  def self.comp_users
     @users = User.where(:expertise => 'Comp')
  end

end
