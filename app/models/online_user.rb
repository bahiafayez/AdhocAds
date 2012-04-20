class OnlineUser < ActiveRecord::Base
  
  has_and_belongs_to_many :tags
  #has_and_belongs_to_many :ads
  
  has_many :ad_users, :dependent => :destroy
  has_many :ads, :through => :ad_users
  
  validates :name, :presence => true
  
  
  def self.number
    all.count
  end
  
end
