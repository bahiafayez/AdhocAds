ActiveAdmin.register Ad do
  
  show do
    div :class => 'panel' do
      h3 'User Details'
      div :class => 'panel_contents' do
        div :class => 'attributes_table ad' do
          table do
            tr do
              th { 'URL' }
              td { ad.url }
            end
            tr do
              th { 'Duration' }
              td { ad.duration }
            end
            tr do
              th { 'Description' }
              td { ad.description }
            end
            tr do
              th { 'Tags' }
              td { (ad.tags.map { |p| p.name }).join(', ') }
            end
          end # table
        end # attributes_table
      end # panel_contents
    end # panel
  end # show
  
  
form do |f|
  f.inputs "Details" do # Project's fields
    f.input :url
    f.input :duration
    f.input :description
    f.input :tags
  end
  
  f.buttons
end

end
