ActiveAdmin.register LiveStream do
  form do |f|
      f.inputs "Details" do
        f.input :proxy
        f.input :publishing_point
        f.input :name
        f.input :URL
        #f.input :published_at, :label => "Publish Post At"
        f.input :status, :as => :select, :collection => ["on air", "off air"] 
      end
      
      f.inputs "Desciption" do
        f.input :description  
        
      
        # next website tells you how to use the form.. its called formtastic gem
        #http://rubydoc.info/gems/formtastic/2.0.2/frames
        
      end
      # f.inputs "Content" do
        # f.input :name
      # end
#       
      # f.inputs :name => "Proxy", :for => :proxy do |proxy|
            # proxy.input :IP
      # end
        
      f.buttons
      
      
    end
end
