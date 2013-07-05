class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
   
  validates :username, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }


  attr_accessible :artistname, :expertise, :artistemail, :mobileno

  validates :artistname, presence: true, length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :artistemail, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, uniqueness: true

  validates :mobileno, presence: true, length: { minimum: 10 }, uniqueness: true

  validates :expertise, presence: true, inclusion: { in: %w(Roto Paint Comp) }

end
