class StreamsController < ApplicationController
  
  def index
    @title="Available Streams"
    @streams= LiveStream.where("status='on air'")
  end

  def show
    logger.debug "LIVE STREAM ID ISSSSSSSSSSSSSSSSSS"
    logger.debug params[:id]
    @video= LiveStream.find(params[:id])
    @videourl="http://#{@video.proxy}/#{@video.publishing_point}?id=#{session[:user_id]}"
  end
  
  def demo1
    session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + callback_path)
    @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream, user_likes, user_about_me, friends_about_me")  
    @sign_in_url= SITE_URL
    @access_token= session[:access_token] 
    cookies["key"]="a"
    cookies[:id]="2"
  end
  
  def getID
    render json: "{\"id\":\"#{session[:user_id]}\"}"
  end
  
  def log_out
    # render :update do |page|
     # page.call 'updateChart', session[:access_token]
   # end
    token=session[:access_token]
    session[:access_token] = nil  
    # delete user from temp table.
    OnlineUser.destroy(session[:user_id])
    session[:user_id]=nil
    
    redirect_to "https://www.facebook.com/logout.php?next=#{SITE_URL}&access_token=#{token}"
  end
  
  # def isaddmoment
    # foo=params[:foo]
    # bar=params[:bar]  
    # add = {:moment=>true, :ad=>"Nestle", :foo=>params[:foo], :bar=>params[:bar]}
    # #render :json =>  add
    # render :json => add 
  # end
  
  def getStream
    url=params[:realurl]
    #bar=params[:bar]  
    @stream=LiveStream.find_by_publishing_point(url)
    
    @ad_slots=[]
    @stream.ad_slots.each do |ad|
      @ad_slots<<ad.time
    end
    
    add = {:url=>@stream.url, :ad_slots=> @ad_slots}
    #render :json =>  add
    render :json => add 
  end
  
  def getAds
    @ads={}
    @id= params[:id]
    @user=OnlineUser.find(@id) #could I do session[:user_id]??
    index =1
    @user.ads.all(:order=> '"order"').each do |ad|
      @ads[index] ={ad.url=> ad.duration}
      index= index+1
    end 
    add = {:ads=>@ads}
    #render :json =>  add
    render :json => add 
    
  end
  
  def getAds2  #for demo1 information
    @ads={}
    @id= session[:user_id]
    @user=OnlineUser.find(@id) #could I do session[:user_id]??
    index =1
    @user.ads.all(:order=> '"order"').each do |ad|
      @ads[index] ={ad.url=> ad.duration}
      index= index+1
    end
    @tags=[]
    @user.tags.all.each do |tag|
      @tags << tag.name
    end
    add = {:name => @user.name, :ads=>@ads, :tags =>@tags }
    #render :json =>  add
    render :json => add  
  end


end
