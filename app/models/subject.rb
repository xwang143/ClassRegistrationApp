class Subject < ApplicationRecord
    has_many :categories
    has_many :courses, through: :categories
end
