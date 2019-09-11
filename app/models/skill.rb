class Skill < ApplicationRecord
    #getting access to Placeholder method from concerns/placeholder.rb
    include Placeholder
    #data validation- a skill must have a title and percent in order to be created.
    validates_presence_of :title, :percent

    after_initialize :set_defaults

    #||= Conditional. Only sets a default image if it DOES NOT already exist. 
    def set_defaults
        self.badge ||= Placeholder.image_generator(height: '250', width: '250')
    end
end
