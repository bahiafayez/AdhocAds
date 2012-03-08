class Backend::SessionsController < Devise::SessionsController
  #layout "backend/sign_in"
  layout "backend"
  self.responder = Backend::ApplicationResponder
end
