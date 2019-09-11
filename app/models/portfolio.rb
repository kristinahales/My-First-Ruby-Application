class Portfolio < ApplicationRecord
    #data validation- a portfolio must have a title, body, main_image, thumb_image in order to be created.
    validates_presence_of :title, :body, :main_image, :thumb_image

    #we are setting default values for the main_image and thumb_image for when a portofolio item has been initialized.
    after_initialize :set_defaults

    #||= Conditional. Only sets a default image if it DOES NOT already exist. 
    def set_defaults
        self.main_image ||= "https://placehold.it/600x400"
        self.thumb_image ||= "https://placehold.it/350x200"
    end

end
