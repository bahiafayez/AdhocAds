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


end
