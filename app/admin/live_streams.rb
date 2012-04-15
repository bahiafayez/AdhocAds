ActiveAdmin.register LiveStream do
  
  # controller do
    # def new
      # @live_stream = LiveStream.new
      # @stream_slot = @live_stream.stream_slots.build
# 
      # # call `new!` to ensure that the rest of the action continues as normal
      # new!
    # end
  # end
  
  #form :partial => "form"
  
  form do |f|
      f.inputs "Details" do
        f.input :proxy
        f.input :publishing_point
        f.input :name
        f.input :url
        #f.input :published_at, :label => "Publish Post At"
        f.input :status, :as => :select, :collection => ["on air", "off air"] 
      end
      
      f.inputs "Description" do
        f.input :description  
        
      end
#       
      # # f.inputs "Ad Slots" do
        # # f.input :ad_slots
        # # #f.inpu
      # # end
#       
    f.has_many :stream_slots do |association|
      association.inputs do 
        if !association.object.nil?
          association.input :_destroy, :as => :boolean, :label => "Destroy?"
        end
        association.input :ad_slot
        association.input :duration
        #association.input :live_stream, :as => :hidden,  :selected => LiveStream.first
      end
   end
      
        # next website tells you how to use the form.. its called formtastic gem
        #http://rubydoc.info/gems/formtastic/2.0.2/frames
        
      #end
      # f.inputs "Content" do
        # f.input :name
      # end
#       
      # f.inputs :name => "Proxy", :for => :proxy do |proxy|
            # proxy.input :IP
      # end
        
     f.buttons
      
      
   end
   
    show :title => :name  do |app|
    #h3 applicant.first_name
    
    panel "LiveStream Information" do
    attributes_table_for live_stream do
      row :id
      row :proxy
      row :publishing_point
      row :name
      row :url
      row :status
      row :description
      row :created_at
      row :updated_at
    end
  end
  
  panel "Stream Slots" do
    table_for live_stream.stream_slots do
      column "Ad Slot" do |slot|
        slot.ad_slot
      end
      column "Duration" do |slot|
        slot.duration
      end
    end
  end
  
  end
   # sidebar "Ad Slots", :only => [:edit, :new] do
     # render "adslots" # Calls a partial
   # end
   
end
