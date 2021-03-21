module EnrollmentsHelper
    def already_enrolled?(course_id)
        Enrollment.find_by(course_id: course_id, user_id:current_user.id)!=nil
    end
end
