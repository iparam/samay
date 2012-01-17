class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  referenced_in :account
  field :name
  field :account_id
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable,   :recoverable, :rememberable, :trackable, :validatable
  
  

     
  
end
