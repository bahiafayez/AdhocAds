class AdSlot < ActiveRecord::Base
  
  has_many :stream_slots, :dependent => :destroy
  has_many :live_streams, :through => :stream_slots
  
  validates :time, :presence => true
  
  
end
