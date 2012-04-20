class OnlineUsersController < InheritedResources::Base
  
  
  #respond_to :json, only: [:number_users]
  def number_users
    @data_point =  OnlineUser.number
    render :json => @data_point
  end

  
end
