class Course < ApplicationRecord
  belongs_to :user
  has_one_attached :banner
  has_many :topics

end
