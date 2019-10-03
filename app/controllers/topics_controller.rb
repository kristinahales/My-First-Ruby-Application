class TopicsController < ApplicationController
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      #the .page(params[:page].per(5)) on Blog is part of the kaminiri gem which allows us to see only 5 blogs at one time.
      #recent is a method from blog.rb that places most recent blog posts first
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      # if not a site admin you will only see published blogs, not drafts.
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end

end
