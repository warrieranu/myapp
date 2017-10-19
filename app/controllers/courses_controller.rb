class CoursesController < ApplicationController
    def index
        @courses = Course.all
        @products = Product.filter(params(:starts_with))
    end
    
    def show_all
        @course = Course.find(params[:id])
    end
end
