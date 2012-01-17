class Account
  include Mongoid::Document
  
  field :name
  field :description
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false  
  references_many :users
  
  before_create :check_user_is_valid?
  after_create :save_user
  
  def users_attributes=(users_attributes)
    self.users.build(users_attributes) 
  end
  
  def check_user_is_valid?
    self.users.first.valid? 
  end
  
  def save_user
    self.users.first.save
  end
  
end
