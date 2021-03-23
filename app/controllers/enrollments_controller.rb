class EnrollmentsController < ApplicationController
    def enroll
        @enrollment = Enrollment.new(user_id:current_user.id,course_id: params[:enroll_course_id])
        if @enrollment.save
            flash[:success] = "Successfully Enrolled!"
            
        else
            flash[:danger] = "Oops Failed to Enroll..."
        end 
        redirect_to search_path
    end 

    def drop
        if Enrollment.find_by(user_id:current_user.id, course_id: params[:drop_course_id]).destroy
            flash[:success] = "Successfully Dropped!"
        else 
            flash[:danger] = "Oops Failed to Drop"
        end
        # redirect_to search_path
        # redirect_to URI(request.referer).path
        redirect_to search_path
    end 

    
end
