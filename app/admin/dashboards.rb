ActiveAdmin::Dashboards.build do

section "Online Users" , :priority => 1 do
    table_for OnlineUser.order("created_at desc").limit(10) do
      column :id do |user|
        link_to user.id, admin_online_user_path(user)
     end
      column :name do |user|
        link_to user.name, admin_online_user_path(user)
      end
      column :created_at
      
    end
    strong { link_to "View All Users", admin_online_users_path }
  end
  
  section "Live Streams", :priority => 2 do
    table_for LiveStream.order('id desc').limit(10).each do |customer|
      column(:url)    {|customer| link_to(customer.url, admin_live_stream_path(customer)) }
    end
  end
  
  section "Page views", :priority => 3 do
    #div do
      text_node %{<iframe src="https://rpm.newrelic.com/public/charts/1CCg33Z1xt4" width="500" height="300" scrolling="no" frameborder="no"></iframe>}.html_safe
    #end
  end
  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
