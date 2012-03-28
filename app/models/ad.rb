class Ad < ActiveRecord::Base
  
  has_and_belongs_to_many :tags
  #has_and_belongs_to_many :online_users
  has_many :ad_users, :dependent => :destroy
  has_many :online_users, :through => :ad_users
  
  validates :url, :duration, :presence => true
  validates :duration , :numericality => true
  #validates :URL , :format => { :with => /(^$)|(^(http|https):\/\/[a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :message => "Not a valid URL" }
  validates :url, :format => {:with => /(^$)|(^(http|https):\/\/[a-zA-Z0-9\/_.:]+.m3u8$)/, :message => "Invalid URL"}
  
  attr_accessor :tag_list
  accepts_nested_attributes_for :tags
  #after_save :update_tags
  
  #paginate
  #paginates_per 5

  private 

  def update_tags
    tags.delete_all
    selected_tags = tag_list.nil? ? [] : tag_list.keys.collect{|id| Tag.find_by_id(id)}
    selected_tags.each {|tag| self.tags << tag}
    #logger.debug "TAG LIST!!!!!!!!!!!!"
    #logger.debug tag_list
    
    #tag_list has values of checked checkboxes : {"23"=>"1", "24"=>"1"}
    #I can access it here.. because it is after ad -> params[ad][tag_list][22] (i think)
    # After save, will call this method.. and i can see tag_list because i made it an attr_accessor
    #as you can see the key is the tag id
    
    #The update_attributes and save methods will assign the tag_list hash from the params
    #to our accessor “tag_list” property automatically and thus provide us convenient 
    # access to the hash data in our callback handler.
    
    #In the paramters as you can see, tag list is under ad:
    #"ad"=>{"URL"=>"http://123.234.12.3:8380/sdsd.m3u8", "duration"=>"4", "description"=>"new ad", "tag_list"=>{"23"=>"1", "24"=>"1"}}
  end
  
   def self.search(search)
      if search
        find(:all, :conditions => ['description LIKE ? or URL LIKE ?', "%#{search}%", "%#{search}%"])
      else
        find(:all)
      end
  end
  
end
