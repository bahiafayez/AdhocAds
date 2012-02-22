class StreamSlot < ActiveRecord::Base
  belongs_to :ad_slot
  belongs_to :live_stream
  
  validates :live_stream_id, :ad_slot_id, :duration , :presence => true
  validates :duration, :numericality => true
  
end
