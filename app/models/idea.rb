class Idea < ApplicationRecord

    belongs_to :user
    
    has_many :reviews, dependent: :destroy

    validates(:title, presence: true, uniqueness: true)

    validates(
        :description,
        presence: true,
        length: {minimum:30}
    )

    before_validation :set_default_title

    private
    def set_default_title
        self.title = self.title.capitalize
    end
end
