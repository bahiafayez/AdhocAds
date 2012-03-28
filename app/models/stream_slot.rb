class StreamSlot < ActiveRecord::Base
  belongs_to :ad_slot
  belongs_to :live_stream
  
  validates :ad_slot_id, :duration , :presence => true  #:live_stream_id,
  validates :duration, :numericality => true
  
  accepts_nested_attributes_for :ad_slot
  
end
