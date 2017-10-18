class CoursesController < ApplicationController
    def show
        @courses = Course.all
    end
end
