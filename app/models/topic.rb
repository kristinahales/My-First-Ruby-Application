class Topic < ApplicationRecord
  #data validation- a topic must have a title to be created.
  validates_presence_of :title
  has_many :blogs

  def self.with_blogs
    # only brings back the topics that have blogs 
    includes(:blogs).where.not(blogs: { id: nil })
  end
end
