module DefaultPageContent 
  extend ActiveSupport::Concern

  included do 
    #run this method before all other controllers
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Kristina Hales Portfolio" 
    #search-engine optimization.
    @seo_keywords = "Kristina Hales portfolio"
  end
end