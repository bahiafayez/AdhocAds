class Proxy < ActiveRecord::Base
  has_many :live_streams
  
  validates :ip, :port , :presence => true
  
  #validates :IP , :format => {:with => /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.
#([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/, :message => "Invalid IP"}

  validates :ip, :ip => { :format => :v4 }

  validates :port, :numericality => { :only_integer => true }
  
  
  
  #alias_attribute :name, :column_name_in_database
  
  def to_s
    "#{ip}:#{port}"
  end 
end
