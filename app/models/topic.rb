class Topic < ApplicationRecord
    #data validation- a topic must have a title to be created.
    validates_presence_of :title
    has_many :blogs
end
