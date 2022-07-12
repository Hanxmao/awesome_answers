class Question < ApplicationRecord

    after_initialize :set_defaults
    before_save :capitalize_title

    has_many :answers, dependent: :destroy
    #dependent :destroy/:nullify
    

    validates :title, presence: {message:'must be provided'}, uniqueness: {scope: :body}, length: {minimum: 2, maximum: 200}
    validates :body, presence: true
    validates :view_count, numericality: {greate_than_or_equal_to: 0}

    scope :recent_ten, -> {order(created_at::desc).limit(10)}
    scope :wildcare_search, ->(search_query) { where("title ILIKE '%#{search_query}% or body ILIKE '%#{search_query}'")}


    private

    def no_monkey
        if body&.downcase&.include?("monkey") 
            # &. is the safe navigation operator. It's used like . operator
            # to call methods of the object
            # If the body doesn't exist,
            # this will return nil instead of getting an error
            self.errors.add(:body, "Must not have monkey")
            # To make a record invalid. You must add a 
            # validation error using the 'errors' 'add' method
            # It's arguments (in order):
            # - A symbol for the invalid column
            # - An error message as a string
        end
    end

    def set_defaults
        self.view_count ||=0
    end

    def capitalize_title
        self.title.capitalize!
    end
 

end
