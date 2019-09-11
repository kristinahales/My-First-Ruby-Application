module Placeholder
    extend ActiveSupport::Concern
    #create a class method 
    def self.image_generator(height:, width:)
        "https://placehold.it/#{height}x#{width}"
    end
end