class Skill < ApplicationRecord
  #data validation- a skill must have a title and percent in order to be created.
  validates_presence_of :title, :percent
end
