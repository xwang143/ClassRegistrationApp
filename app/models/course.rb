class Course < ApplicationRecord
    has_many :categories
    has_many :subjects, through: :categories
end
