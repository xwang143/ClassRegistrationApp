Instructor.delete_all
Course.delete_all
Subject.delete_all
Category.delete_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

puts "Start loading"

# array for each table
instructors=[]
courses = []
subjects=[]
categories=[] # the array for join table

# id_subId = {}

# Get path
path_instructor = Rails.root.join('data', 'instructor.json')
path_course = Rails.root.join('data', 'course.json')
path_subject= Rails.root.join('data', 'subject.json')

# Read file
file_instructor = File.read(path_instructor)
file_course = File.read(path_course)
file_subject = File.read(path_subject)

# Parse file
hash_instructor = JSON.parse(file_instructor)
hash_course = JSON.parse(file_course)
hash_subject = JSON.parse(file_subject)

# Populates arrays
hash_instructor.each do |item|
    instructors << Instructor.new(first: item["first"], last: item["last"], email: item["email"] )
end

hash_course.each do |item|
    courses << Course.new(name: item["name"], code: item["code"], description: item["description"])
end

num = 0
hash_subject.each do |item|
    num += 1
    subjects << Subject.new(name: item["name"], abbr: item["abbreviation"], sub_id: item["id"])
    # id_subId[item["id"]] = num
end

# # do sth to categories
# num = 0
# hash_course.each do |item|
#     num += 1
#     item["subjects"].each do |subject|
#         categories << Category.new(course_id: num, subject_id: id_subId[subject["id"]], sub_id: subject["id"])
#     end
# end
Instructor.import instructors
Course.import courses
Subject.import subjects
puts "End loading instructors, courses, subjects"

hash_course.each do |course_item|
    cur_course_code = course_item["code"]
    cur_course_id = Course.all.find_by(code: cur_course_code).id
    course_item["subjects"].each do |sub_item|
        cur_sub_id = sub_item["id"]
        # puts cur_sub_id
        cur_subject = Subject.all.find_by(sub_id: cur_sub_id)
        unless cur_subject==nil
            cur_subject_id = Subject.all.find_by(sub_id: cur_sub_id).id
            categories << Category.new(course_id:cur_course_id, subject_id:cur_subject_id, sub_id:cur_sub_id )
        end 
    end
end 


Category.import categories
puts "End loading categories"




