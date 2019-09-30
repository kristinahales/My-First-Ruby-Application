class Portfolio < ApplicationRecord
    #establishing connection with db technology table
    has_many :technologies

    #accepts multiple attributes
    #in terminal would type: 
    #Portfolio.create!(title: "Web app", substring: "It is awesome", body: "Some text", technologies_attributes: [{name: "Ruby"}, {name: "Angular"}, {name: "React.js"}])
    #do not accept this if the attribute of name from technologies db table if blank
    accepts_nested_attributes_for :technologies,
                                    reject_if: lambda { |attrs| attrs['name'].blank?}

    # getting access to Placeholder method from concerns/placeholder
    include Placeholder

    #data validation- a portfolio must have a title, body, main_image, thumb_image in order to be created.
    validates_presence_of :title, :body, :main_image, :thumb_image

    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader


    #we are setting default values for the main_image and thumb_image for when a portofolio item has been initialized.
    after_initialize :set_defaults

    #||= Conditional. Only sets a default image if it DOES NOT already exist. 
    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end

    #positions portfolio items in ascending order 
    def self.by_position
        order("position ASC")
    end
end
