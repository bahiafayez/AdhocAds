class Plan < ActiveRecord::Base
  
  has_and_belongs_to_many :ads
  has_many :online_users
  
  validates :name , :presence => true
end
