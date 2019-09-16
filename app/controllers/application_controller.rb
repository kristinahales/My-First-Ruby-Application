#master controller for the entire app

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #including this module from concerns/deviser_whitelist
  include DeviseWhitelist
  #including this module from concerns/current_user_concern
  include CurrentUserConcern
  include DefaultPageContent

end
