#require "application_responder"
class Backend::ResourceController < Backend::ApplicationController
  inherit_resources
  respond_to :html
  self.responder = Backend::ApplicationResponder
  before_filter :authenticate_administrator!
 
end