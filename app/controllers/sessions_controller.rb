class SessionsController < ApplicationController
  
  protect_from_forgery
  
   def new
     @title= "Hello There!"
     session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + callback_path)
     @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream, user_likes, user_about_me, friends_about_me")  
     puts session.to_s + "<<< session"

     respond_to do |format|
       format.html {  }
     end
   end
   
  
  

  def callback
    if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end   

     # auth established, now do a graph call:
      
    @api = Koala::Facebook::API.new(session[:access_token])
    begin
      @graph_data = @api.get_object("me")
      @likes=@api.get_connections("me","likes")
      @picture = @api.get_picture("me")
      @friends=@api.get_connections("me","friends")
      @title="Welcome #{@graph_data["name"]}"
    rescue Exception=>ex
      puts ex.message
    end
    
  
    respond_to do |format|
     format.html {   }       
    end
    
  
  end
  
  def destroy
    session[:oauth] = nil
    session[:access_token] = nil
    params[:code]= nil
    redirect_to home_url , notice: "Logged out"
  end

end
