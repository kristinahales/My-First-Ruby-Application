#whenever we create a new blog post, by default it is going to be in draft mode until it is published and the state changes.
class Blog < ApplicationRecord
    enum status: {draft: 0, published: 1}
    extend FriendlyId
    friendly_id :title, use: :slugged

    #data validation- a blog post must have a title and body in order to be created.
    validates_presence_of :title, :body

    belongs_to :topic

    has_many :comments, dependent: :destroy

    def self.recent
        order("created_at DESC")
    end

end
