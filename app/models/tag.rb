class Tag < ActiveRecord::Base
  
  has_and_belongs_to_many :ads
  has_and_belongs_to_many :online_users
  
  before_destroy :clear_all
  
  validates :name, :presence => true
  
  
  private 
  
  def clear_all
    logger.debug 'kk'
    ads.clear
    online_users.clear
  end
  
end
