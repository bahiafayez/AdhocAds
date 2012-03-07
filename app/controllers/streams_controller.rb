class StreamsController < ApplicationController
  
  def index
    @title="Available Streams"
    @streams= LiveStream.where("status='on air'")
  end

  def show
  end
end
