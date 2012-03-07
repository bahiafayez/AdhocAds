class Backend::ApplicationController < ActionController::Base
  protect_from_forgery
end

#I'm inheriting from the action controller  not the application controller.. 
# to be completely separated