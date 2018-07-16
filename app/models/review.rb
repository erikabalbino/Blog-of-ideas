class Review < ApplicationRecord
  belongs_to :idea

  validates(
    :body, 
    presence: true,
    length: {
        minimum: 25
    })
end
