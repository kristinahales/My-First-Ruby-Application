#master controller for the entire app

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #including this module from concerns/deviser_whitelist
  include DeviseWhitelist
end
