class OnlineUser < ActiveRecord::Base
  
  has_and_belongs_to_many :tags
  belongs_to :plan
  
  validates :name, :plan_id , :presence => true
  
end
