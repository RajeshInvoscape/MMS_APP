class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :username, :mobilenumber, :expertise, :admin
  has_secure_password
  
  has_many :shot_users,  dependent: :destroy
  has_many :shots, through: :shot_users 


  validates :username, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true,length: { minimum: 6 }
  validates :mobilenumber, presence: true, length: { minimum: 10 }, uniqueness: true, if: :is_admin?
  validates :expertise, presence: true, inclusion: { in: %w(Roto Paint Comp) }, if: :is_admin?
  validates :password_confirmation, presence: true
  after_validation { self.errors.messages.delete(:password_digest) }
  
  def is_admin?
    admin == false
  end 

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
