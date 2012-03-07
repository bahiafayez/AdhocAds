class SessionsController < ApplicationController
  
  protect_from_forgery
  
   def new
     #@title= "Hello There!"
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
      @streams= LiveStream.where("status='on air'")
      
      #we want to store this into the users table
      @userID= @graph_data["id"]
      
      #if empty.. means user not online.. will add him
      if OnlineUser.where(:facebook_id => @userID).empty?
      
        @user= OnlineUser.new(:name => @graph_data["name"], :facebook_id => @userID)
        #lets collect all tags
        @tags=[]
        
        # appending likes
        @likes.each do |like|
          unless @tags.include?(like['category'])
            @tags<< like['category']
          end
        end
        
        #appending me details
        unless @graph_data['gender'].nil?
          @tags << @graph_data['gender']
        end
         
        unless @graph_data['locale'].nil?
          @tags << @graph_data['locale']
        end 
     
        # what about age? I've got the birthday, could deduce age..
        
        
        #Now I'm saving the user tags.
        @tags.each do |tag|
          @found=false
          Tag.all.each do |tag_db|
            if tag==tag_db.name
              @found=true
              @user.tags<<tag_db
            end 
          end
          if @found==false
              @user.tags.new(:name=>tag)
          end
          @found=false
        end
        
        #Now I want to create the ad-user association, by matching the tags.
        
        
        @score={}
        Ad.all.each do |ad|
          @score[ad.id]=0
          #first adding positive score if tag in both
          @user.tags.each do |user_tag|
            if ad.tags.include?(user_tag)   # later change.. don't have to match completely
              @score[ad.id]=@score[ad.id] +1
            end
          end
          # decrementing score if tag in ad and not in user
          ad.tags.each do |ad_tag|
            if !@user.tags.include?(ad_tag) #later change..if match slightly then shouldn't decrement score..
              @score[ad.id]=@score[ad.id] -1
            end
          end            
        end
        logger.debug "HEREEEEEEEEEEEEE"
        logger.debug @score
        
        
        #now that I have the score for each ad, can order them and place them in the ad-user table.
        @score=@score.sort_by{ |k,v| v }.reverse
       # @score.each do |score|
       #   @user.ads<<Ad.find(score[0])
       # end
        
        for i in 0..@score.size-1
          #@user.ads<<Ad.find(@score[i][0])
          @user.ad_users.new(:ad_id => @score[i][0], :order => i+1, :played=> false)
        end
        
     else #user already online!
       @user= OnlineUser.find_by_facebook_id(@userID)
     end
          
      
    rescue Exception=>ex
      puts ex.message
    end
    
    respond_to do |format|
      if @user.save
        session[:user_id]=@user.id
        format.html { redirect_to "/streams/index", notice: 'You have successfully logged in.' }
      else
        format.html { render action: "new" }
      end
    end
  
  end
  
  def destroy
    session[:oauth] = nil
    session[:access_token] = nil
    params[:code]= nil
    
    # delete user from temp table.
    OnlineUser.destroy(session[:user_id])
    session[:user_id]=nil
    
    redirect_to login_url , notice: "Logged out"
  end

end
