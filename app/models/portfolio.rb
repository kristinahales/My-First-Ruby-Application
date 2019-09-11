class Portfolio < ApplicationRecord
    #data validation- a portfolio must have a title, body, main_image, thumb_image in order to be created.
    validates_presence_of :title, :body, :main_image, :thumb_image

end
