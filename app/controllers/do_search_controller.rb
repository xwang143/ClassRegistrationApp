class DoSearchController < ApplicationController
    def new
    end 
    
    def display 
       
        if params[:subject_id].blank?
            @courses = Course.where("name LIKE ?", "%#{params[:search]}%")
        else
            @courses = Subject.find_by(sub_id: params[:subject_id]).courses.where("name LIKE ?","%#{params[:search]}%")
        end
    end 

end
