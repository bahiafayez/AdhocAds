class AdUser < ActiveRecord::Base
  
  belongs_to :ad
  belongs_to :online_user
  
end
