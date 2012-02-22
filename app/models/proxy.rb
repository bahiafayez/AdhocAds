class Proxy < ActiveRecord::Base
  has_many :live_streams
  
  validates :IP, :port , :presence => true
  
  validates :IP , :format => {:with => /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.
([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/, :message => "Invalid IP"}

  validates :port, :numericality => { :only_integer => true }
  
end
