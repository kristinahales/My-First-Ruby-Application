class Portfolio < ApplicationRecord
    #establishing connection with db technology table
    has_many :technologies
    #getting access to Placeholder method from concerns/placeholder.r
    include Placeholder
    #data validation- a portfolio must have a title, body, main_image, thumb_image in order to be created.
    validates_presence_of :title, :body, :main_image, :thumb_image

    #we are setting default values for the main_image and thumb_image for when a portofolio item has been initialized.
    after_initialize :set_defaults

    #||= Conditional. Only sets a default image if it DOES NOT already exist. 
    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end

end
