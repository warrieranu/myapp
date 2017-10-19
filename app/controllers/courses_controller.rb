class CoursesController < ApplicationController
    def index
        @courses = Course.all
        if params[:search].present?
            @courses = ((@courses.search(params[:search]))+(@courses.search_one(params[:search]))).uniq {|x| x.id}
        end
        
    end
    
    def show
        @course = Course.find(params[:id])
    end
    
end
