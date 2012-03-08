class LiveStream < ActiveRecord::Base
  belongs_to :proxy
  
  has_many :stream_slots, :dependent => :destroy
  has_many :ad_slots, :through => :stream_slots
  
  validates :publishing_point, :proxy_id, :status, :url, :presence => true
  validates :url, :format => {:with => /(^$)|(^(http|https):\/\/[a-z0-9\/_.:]+.m3u8$)/, :message => "Invalid URL"}
  
  validates_inclusion_of :status, :in => ["on air", "off air"]
  
  def status
    read_attribute(:status).to_s
  end
  
  def status= (value)
    write_attribute(:status, value.to_s)
  end
  
end
