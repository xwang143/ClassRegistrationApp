class Course < ApplicationRecord
    has_many :categories
    has_many :subjects, through: :categories
    
    has_many :enrollments
    has_many :users, through: :enrollments
end
