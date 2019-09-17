#the PagesController inherits from the ApplicationController
class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  #the action name must match file name
  def about
  end

  #the action name must match file name
  def contact
  end
end
