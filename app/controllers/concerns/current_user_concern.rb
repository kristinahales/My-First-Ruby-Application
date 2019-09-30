module CurrentUserConcern
  #gives us access to all the method without the ActiveSupport module
  extend ActiveSupport::Concern

  #this method will either call its parent (super) or create a guest user using the null object pattern.
  def current_user
    #super = is there a current user... true or false?
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end

end