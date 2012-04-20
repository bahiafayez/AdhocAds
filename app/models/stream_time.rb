class StreamTime < ActiveRecord::Base
  
  def self.getData
    @a=StreamTime.all
    @points={}
    @clients={}
    @users={}
    previous=""
    x=0
    @a.each do |a|
      if previous==""
        x=0
        previous=a.polltime
      else
        x= (a.polltime.to_time - previous.to_time)
        if x>300
          @points[previous.to_i]=@clients
          previous=a.polltime
          @clients={}
          x=0  
        end
      end
      #logger.debug x
      #if !@points[a.polltime].blank?
      #@points[a.polltime]=@points[a.polltime]+1
      #previous=a.polltime
      
      
      
      if @clients[a.stream].nil?
        @clients[a.stream]=1
        #logger.debug "here"
      else
        if !@users[a.user].include?(a.stream)
          @clients[a.stream]=@clients[a.stream]+1
        end
      end
      
      if @users[a.user].blank?
        @users[a.user]=[a.stream]
      else
        @users[a.user]<<a.stream
      end
      
    end
    #logger.debug @clients
    #logger.debug @users
    logger.debug @points
    return @points
  end
end
