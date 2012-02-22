class LiveStream < ActiveRecord::Base
  belongs_to :proxy
  
  has_many :stream_slots, :dependent => :destroy
  has_many :ad_slots, :through => :stream_slots
  
  validates :publishing_point, :proxy_id, :status, :URL, :presence => true
  validates :URL, :format => {:with => /(^$)|(^(http|https):\/\/[a-z0-9\/_.:]+.m3u8$)/, :message => "Invalid URL"}
  
end
