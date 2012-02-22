class Ad < ActiveRecord::Base
  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :plans
  
  validates :URL, :duration, :presence => true
  validates :duration , :numericality => true
  #validates :URL , :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :message => "Not a valid URL" }
  validates :URL, :format => {:with => /(^$)|(^(http|https):\/\/[a-z0-9\/_.:]+.m3u8$)/, :message => "Invalid URL"}
  
  
  
end
